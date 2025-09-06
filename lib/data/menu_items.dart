import 'package:flutter/material.dart';
import 'package:krautheimer_shisha_bar/screens/longdrinks_screen.dart';
import 'package:krautheimer_shisha_bar/screens/strong_screen.dart';
import '../models/CatItem.dart';
import '../screens/classic_screen.dart';
import '../screens/fancy_screen.dart';
import '../screens/high_balls_screen.dart';
import '../screens/sours_screen.dart';
import '../widgets/GlowText.dart';

GlowText _glow(String text) => GlowText(
  text,
  glowColor: Colors.purpleAccent,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

final List<CatItem> menuItems = [
  CatItem(
      _glow('COCKTAILS\nCLASSIC'),
      'assets/images/classic_menu.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('HIGH BALLS'),
      'assets/images/high_balls_menu.png',
      const HighBallsScreen()
  ),
  CatItem(
    _glow('COCKTAILS\nSTRONG'),
    'assets/images/cStrong.png',
    const StrongScreen(),),
  CatItem(
    _glow('SOURS'),
    'assets/images/sour.png',
    const SoursScreen(),
  ),
  CatItem(
    _glow('FANCY\nDRINKS'),
    'assets/images/fancyDrink.png',
    const FancyScreen(),
  ),
  CatItem(
      _glow('LONGDRINK'),
      'assets/images/longDrink.png', const LongDrinksScreen()
  ),
  CatItem(
      _glow('SHOOTERS'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('FLASCHEN'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('BIER'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('ENERGY\nDRINKS'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('SOFTDRINKS'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('HAUSGEMACHTE EISTEE & \nLIMONADE'),
      'assets/images/dance.jpg',
      const ClassicScreen()),
  CatItem(
      _glow('COCKTAILS\nALKOHOLFREI'),
      'assets/images/dance.jpg', const ClassicScreen()),
  CatItem(
      _glow('HEISSE GETRÄNKE'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('SNACKS'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('SNACKSPIZZA &\nBAGUETTE'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
  CatItem(
      _glow('SHISHA'),
      'assets/images/dance.jpg',
      const ClassicScreen()
  ),
];
