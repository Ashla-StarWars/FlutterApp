import 'package:flutter/material.dart';
import 'package:flutter_app/components/shoe_tile.dart';
import 'package:flutter_app/utils/Globals.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';

class ShopPage extends StatefulWidget {
  final VoidCallback onTap;
  const ShopPage({super.key, required this.onTap});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(texts!.shop_search,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface)),
                Icon(Icons.search,
                    color: Theme.of(context).colorScheme.surface),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                SizedBox(height: 16),
                Center(
                  child: Text(texts.shop_slogan),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🔥 ${texts.shop_category_hot_picks}!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(texts.shop_see_all,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 260, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: shoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ShoeTile(
                        shoe: shoes[index],
                        onTap: widget.onTap,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🏆 ${texts.shop_category_top_sales}!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(texts.shop_see_all,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 260, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: shoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ShoeTile(
                        shoe: shoes[index],
                        onTap: widget.onTap,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '👀 ${texts.shop_category_most_viewed}!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(texts.shop_see_all,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 260, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: shoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ShoeTile(
                        shoe: shoes[index],
                        onTap: widget.onTap,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
