import 'package:flutter/material.dart';
import '../data/softdrinks_items.dart';
import '../widgets/MenuItemCard.dart';

class SoftdrinksScreen extends StatelessWidget {
  const SoftdrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Softdrinks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: softdrinksItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: MediaQuery.of(context).size.height / 4,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final item = softdrinksItems[index];
            return MenuItemCard(
              title: item.title,
              imagePath: item.imagePath,
              price: item.price,
            );
          },
        ),
      ),
    );
  }
}
