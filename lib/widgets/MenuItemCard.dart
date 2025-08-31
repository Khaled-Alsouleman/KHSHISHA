import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double price;

  const MenuItemCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: MediaQuery.of(context).size.height /5,
        width: MediaQuery.of(context).size.width /0.8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bild oben
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            // Balken unten mit Name + Preis
            Container(
              color: const Color(0xFF121214),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name links
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Preis rechts
                  Text(
                    "${price.toStringAsFixed(2)}€",
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
