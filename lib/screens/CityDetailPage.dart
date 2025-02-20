import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Globals.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';

class CityDetailPage extends StatelessWidget {
  final Map<String, String> city;
  const CityDetailPage({super.key, required this.city});
  @override
  Widget build(BuildContext context) {

    final texts = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(city['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: city['image']!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  city['image']!,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  city['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(texts!.confirm_delete_city_title),
                          content: Text(
                              texts.confirm_delete_city_message),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(texts.confirm_delete_city_no),
                            ),
                            TextButton(
                              onPressed: () {
                                cities.remove(city);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(true);
                              },
                              child: Text(texts.confirm_delete_city_no,
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context)
                              .colorScheme
                              .primary)
                      ),
                  child: Icon(Icons.delete, size: 24, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  city['description']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
