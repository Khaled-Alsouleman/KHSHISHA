import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20);
    final clean = title.replaceAll('\n', ' ');

    return Scaffold(
      appBar: AppBar(
        title: Text(clean),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: radius,
            child: Image.asset(
              imagePath,
              height: 240,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 6,
              color: Colors.white.withOpacity(0.8),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
