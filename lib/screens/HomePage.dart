import 'package:flutter/material.dart';
import 'package:flutter_app/screens/CityDetailPage.dart';
import 'package:flutter_app/utils/Constants.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  void _openCityDetails(BuildContext context, Map<String, String> city) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CityDetailPage(city: city),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        title: Text('Bienvenid@, $username!'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [

            DrawerHeader(
              child: Icon(Icons.shopify, size: 80,color: Theme.of(context).colorScheme.onSurface,)
            ),

            //HOME PAGE LIST TILE
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text("H O M E"),
              onTap: () {
                // DO TAP
              },
            ),

            // SETTINGS PAGE LIST TILE
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text("S E T T I N G S"),
              onTap: () {
                // DO TAP
              },
            ),

            Spacer(),

            // LOGOUT PAGE LIST TILE
            ListTile(
              leading: Icon(Icons.exit_to_app),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text("LOG _OUT"),
              onTap: () {
                // DO TAP
              },
            ),

          ],
        ),
      ),

      body: ListView.builder(
        itemCount: Constants().cities.length,
        itemBuilder: (context, index) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: Hero(
                  tag: Constants().cities[index]['image']!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        100), // Cambia el valor para ajustar el redondeo
                    child: Image.network(
                      Constants().cities[index]['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(Constants().cities[index]['name']!),
                subtitle: Text(
                    'Población: ${Constants().cities[index]['population']}'),
                onTap: () =>
                    _openCityDetails(context, Constants().cities[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
