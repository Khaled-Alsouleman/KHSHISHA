import 'package:flutter/material.dart';
import '../widgets/MenuItemCard.dart';


class HighBallsScreen extends StatelessWidget {
  const HighBallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"title": "Moscow Mule", "image": "assets/images/MoscowMule.png", "price": 8.90},
      {"title": "Gin Mule", "image": "assets/images/Ginmule.png", "price": 8.90},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Cocktails Classic",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: MediaQuery.of(context).size.height /4,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return MenuItemCard(
              title: item["title"] as String,
              imagePath: item["image"] as String,
              price: item["price"] as double,
            );
          },
        ),
      ),
    );
  }
}
