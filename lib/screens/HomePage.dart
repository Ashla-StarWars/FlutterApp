import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/providers/locale_provider.dart';
import 'package:flutter_app/utils/Globals.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('${texts!.welcome_title}, ${widget.username}!'),
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
              title: Text(texts.drawer_home),
              onTap: () {
                // DO TAP
              },
            ),

            // SETTINGS PAGE LIST TILE
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text(texts.drawer_settings),
              onTap: () {
                // DO TAP
              },
            ),

            ListTile(
              leading: Icon(Icons.info_outline),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text(texts.drawer_about),
              onTap: () {
                // DO TAP
              },
            ),

ListTile(
  leading: Icon(Icons.language),
  iconColor: Theme.of(context).colorScheme.onSurface,
  textColor: Theme.of(context).colorScheme.onSurface,
  title: Text(texts.drawer_language),
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("texts.language_selection_title"), // Sin comillas
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('en', 'US'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Español'),
                onTap: () {
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('es', 'ES'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Català'),
                onTap: () {
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('ca', 'ES'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  },
),


            ListTile(
              leading: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Text(texts.drawer_theme),
              onTap: () {
                // Toggle theme
                if (Theme.of(context).brightness == Brightness.dark) {
                  Globals.themeNotifier.value = ThemeMode.light;
                } else {
                  Globals.themeNotifier.value = ThemeMode.dark;
                }
              },
            ),

            Spacer(),

            // LOGOUT PAGE LIST TILE
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              iconColor: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: Center(child: Text(texts.drawer_logout)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(texts.logout_confirmation_title),
                      content: Text(texts.logout_confirmation_message),
                      actions: [
                        TextButton(
                          child: Text(texts.logout_confirmation_no),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(texts.logout_confirmation_yes),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Close the application
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.login, (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    );
                  },
                );
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
                      setState(
                          () {}); // Recargar la lista si se eliminó una ciudad
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}
