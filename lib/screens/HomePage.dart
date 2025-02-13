import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/utils/Globals.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Bienvenid@, ${widget.username}!'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.shopify,
              size: 80,
              color: Theme.of(context).colorScheme.onSurface,
            )),

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
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                  leading: Hero(
                    tag: cities[index]['image']!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        cities[index]['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(cities[index]['name']!),
                  subtitle: Text('Población: ${cities[index]['population']}'),
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      Routes.city,
                      arguments: cities[index],
                    );
                    if (result == true) {
                      setState(() {}); // Recargar la lista si se eliminó una ciudad
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}
