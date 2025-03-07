import 'package:flutter/material.dart';
import 'package:flutter_app/models/shoe.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';

class ShoeDetailPage extends StatelessWidget {
  final Shoe shoe;
  const ShoeDetailPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: shoe.imagePath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(shoe.imagePath),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.simpleCurrency(
                          locale: Localizations.localeOf(context).toString())
                      .format(shoe.price),
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              shoe.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              '${texts!.shop_product_detail_created_at}: ${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(shoe.createdAt)}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.onPrimary),
                label: Text(texts.shop_product_detail_buy_now_button,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary)),
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
