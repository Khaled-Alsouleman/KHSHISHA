import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'GlowText.dart';

/// Bequemer Wrapper: GlowText + Shimmer in einem Widget.
class ShimmerGlowText extends StatelessWidget {
  const ShimmerGlowText(
      this.text, {
        super.key,

        // GlowText
        this.textColor = Colors.white,
        this.glowColor = Colors.red,
        this.fontSize = 16,
        this.fontWeight = FontWeight.normal,
        this.layers = 3,
        this.blurStep = 3.0,

        // Shimmer
        this.duration = const Duration(seconds: 2),
        this.interval = const Duration(milliseconds: 800),
        this.shimmerColor = Colors.white,
        this.shimmerOpacity = 0.35,
        this.enabled = true,
        this.direction = const ShimmerDirection.fromLTRB(),
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  final String text;

  // GlowText props
  final Color textColor;
  final Color glowColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int layers;
  final double blurStep;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  // Shimmer props
  final Duration duration;
  final Duration interval;
  final Color shimmerColor;
  final double shimmerOpacity;
  final bool enabled;
  final ShimmerDirection direction;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: duration,
      interval: interval,
      color: shimmerColor,
      colorOpacity: shimmerOpacity,
      enabled: enabled,
      direction: direction,
      child: GlowText(
        text,
        textColor: textColor,
        glowColor: glowColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        layers: layers,
        blurStep: blurStep,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
