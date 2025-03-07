import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/providers/locale_provider.dart';
import 'package:flutter_app/screens/ShopPage.dart';
import 'package:flutter_app/utils/Globals.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cartCount = 0;
  int _selectedIndex = 0;

  void _addToCart() {
    print('Added to cart!');
    setState(() {
      _cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('${texts!.welcome_title}, ${widget.username}!'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$_cartCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset('lib/images/nike.png'))),
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
                      title:
                          Text(texts.language_selection_title), // Sin comillas
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(texts.language_selection_english),
                            onTap: () {
                              Provider.of<LocaleProvider>(context,
                                      listen: false)
                                  .setLocale(const Locale('en', 'US'));
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text(texts.language_selection_spanish),
                            onTap: () {
                              Provider.of<LocaleProvider>(context,
                                      listen: false)
                                  .setLocale(const Locale('es', 'ES'));
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text(texts.language_selection_catalan),
                            onTap: () {
                              Provider.of<LocaleProvider>(context,
                                      listen: false)
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Container(
                color: Theme.of(context).colorScheme.surface,
                child: Card(
                  color: Theme.of(context).colorScheme.onPrimary,
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
                        '/city',
                        arguments: cities[index],
                      );
                      if (result == true) {
                        setState(
                            () {}); // Recargar la lista si se eliminó una ciudad
                      }
                    },
                  ),
                ),
              );
            },
          ),
          ShopPage(
            onTap: _addToCart,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            gap: 8,
            activeColor: Theme.of(context).colorScheme.onSurface,
            color: Colors.grey[700],
            iconSize: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            duration: Duration(milliseconds: 400),
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade500,
            tabBorderRadius: 16,
            tabs: [
              GButton(
                icon: Icons.location_city,
                text: texts.bottom_bar_cities_option,
              ),
              GButton(
                icon: Icons.shop,
                text: texts.bottom_bar_shop_option,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
