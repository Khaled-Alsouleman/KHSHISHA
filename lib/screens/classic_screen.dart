import 'package:flutter/material.dart';
import '../widgets/MenuItemCard.dart';


class ClassicScreen extends StatelessWidget {
  const ClassicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"title": "Bacardi Razz Mojito", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Tropical", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Pina Colada", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Swimming Pool", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Sex on the Beach", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Strawberry Colada", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Touchdown", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Tequila Sun Rises", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Cuba Libre", "image": "assets/images/dance.jpg", "price": 8.90},
      {"title": "Mojito", "image": "assets/images/dance.jpg", "price": 8.90},
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
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
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
