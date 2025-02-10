import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Globals.dart';

class CityDetailPage extends StatelessWidget {
  final Map<String, String> city;
  const CityDetailPage({super.key, required this.city});
  @override
  Widget build(BuildContext context) {
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
                          title: Text("Confirmar eliminación"),
                          content: Text(
                              "¿Estás seguro de que quieres eliminar esta ciudad?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Cerrar el diálogo sin hacer nada
                                Navigator.of(context).pop();
                                
                              },
                              child: Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                cities.remove(city);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(true);                               },
                              child: Text("Eliminar",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context)
                          .colorScheme
                          .primary) // Aquí está la corrección
                      ),
                  child: Icon(Icons.delete, size: 24, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              city['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
