import 'package:flutter/material.dart';
import '../widgets/GlowText.dart';

class CatItem {
  final GlowText title;
  final String imagePath;
  final Widget child;

  const CatItem(this.title, this.imagePath, this.child);
}
