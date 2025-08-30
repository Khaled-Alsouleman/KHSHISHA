import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  const GlowText(
      this.text, {
        super.key,
        this.textColor = Colors.white,
        this.glowColor = Colors.red,
        this.fontSize = 16,
        this.fontWeight = FontWeight.normal,
        this.layers = 3,
        this.blurStep = 3.0,
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  final String text;
  final Color textColor;
  final Color glowColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int layers;
  final double blurStep;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final shadows = List<Shadow>.generate(
      layers,
          (i) => Shadow(
        color: glowColor,
        blurRadius: blurStep * (i + 1), // 3, 6, 9 ...
      ),
    );

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
      ),
    );
  }
}
