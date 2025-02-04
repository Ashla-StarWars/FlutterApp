import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_usernameController.text == 'user' &&
            _passwordController.text == 'pass12345') {
          _errorMessage = null;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(username: _usernameController.text),
            ),
          );
        } else {
          _errorMessage = 'Credenciales incorrectas';
        }
      });
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    } else if (value.length < 7) {
      return 'La contraseña debe tener al menos 7 caracteres';
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
      return 'Debe contener letras y números';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                height: 100,
              ),
              SizedBox(height: 20),
              Spacer(),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El usuario no puede estar vacío';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: _validatePassword,
              ),
              SizedBox(height: 10),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: Text('Forgot Password?'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text('New User? Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<Map<String, String>> cities = [
    {
      'name': 'Barcelona',
      'population': '1,620,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Aerial_view_of_Barceloneta_Beach_and_Port_Vell_in_Barcelona%2C_Spain.jpg/286px-Aerial_view_of_Barceloneta_Beach_and_Port_Vell_in_Barcelona%2C_Spain.jpg'
    },
    {
      'name': 'Madrid',
      'population': '3,300,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Palaciorealycatedraldelaalmudena_retouched.jpg/284px-Palaciorealycatedraldelaalmudena_retouched.jpg'
    },
    {
      'name': 'Valencia',
      'population': '800,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Valencia_Sightseeing_0001_%28203798303%29_cropped.jpeg/203px-Valencia_Sightseeing_0001_%28203798303%29_cropped.jpeg'
    },
    {
      'name': 'Sevilla',
      'population': '690,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Monumental_Plaza_de_Espa%C3%B1a_de_Sevilla_retouched.jpg/284px-Monumental_Plaza_de_Espa%C3%B1a_de_Sevilla_retouched.jpg'
    },
    {
      'name': 'Bilbao',
      'population': '350,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Puente_e_iglesia_de_San_Ant%C3%B3n_%28Bilbao%29_%282%29.jpg/140px-Puente_e_iglesia_de_San_Ant%C3%B3n_%28Bilbao%29_%282%29.jpg'
    },
    {
      'name': 'Zaragoza',
      'population': '670,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Zaragoza_-_Bas%C3%ADlica_del_Pilar_y_r%C3%ADo_Ebro.jpg/284px-Zaragoza_-_Bas%C3%ADlica_del_Pilar_y_r%C3%ADo_Ebro.jpg'
    },
    {
      'name': 'Málaga',
      'population': '580,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Da_Gibralfaro_%28cropped%29.jpg/284px-Da_Gibralfaro_%28cropped%29.jpg'
    },
    {
      'name': 'Granada',
      'population': '230,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Alhambra_I_%2815381913145%29_cropped.jpg/284px-Alhambra_I_%2815381913145%29_cropped.jpg'
    },
    {
      'name': 'Alicante',
      'population': '330,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Vista_de_Alicante%2C_Espa%C3%B1a%2C_2014-07-04%2C_DD_49.JPG/284px-Vista_de_Alicante%2C_Espa%C3%B1a%2C_2014-07-04%2C_DD_49.JPG'
    },
    {
      'name': 'Córdoba',
      'population': '325,000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/C%C3%B3rdoba_%28Espa%C3%B1a%29_IMG_1896_%2853664801561%29.jpg/140px-C%C3%B3rdoba_%28Espa%C3%B1a%29_IMG_1896_%2853664801561%29.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenid@, ${widget.username}!'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: Image.network(
                cities[index]['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(cities[index]['name']!),
              subtitle: Text('Población: ${cities[index]['population']}'),
            ),
          );
        },
      ),
    );
  }
}
