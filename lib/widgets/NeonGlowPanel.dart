import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Neon-Panel mit optionalem Hintergrundbild und steuerbarem Glow.
/// Neu: [childScrollable] -> Inhalt scrollt innerhalb des Panels.
class NeonGlowPanel extends StatelessWidget {
  const NeonGlowPanel({
    super.key,
    this.width,
    this.height,

    // Rahmen & Glow
    this.borderRadius = 14,
    this.strokeWidth = 2.0,
    this.glowWidthFactor = 1.8,
    this.glowSigma = 18.0,
    this.glowOpacity = 0.85,
    this.borderOpacity = 1.0,

    // Verlauf
    this.gradientColors = const [
      Color(0xFF6EE7F9),
      Color(0xFF10B981),
      Color(0xFFF59E0B),
      Color(0xFF6EE7F9),
    ],
    this.gradientStops = const [0.0, 0.45, 0.78, 1.0],
    this.gradientRotation = -math.pi / 20,

    // Inhalt & Hintergrund
    this.panelColor = const Color(0xFF101010),
    this.padding = const EdgeInsets.all(12),
    this.backgroundImage,
    this.backgroundOpacity = 0.0,
    this.backgroundFit = BoxFit.cover,
    this.backgroundAlignment = Alignment.center,

    // Neu:
    this.childScrollable = false,
    this.childAlignment = Alignment.center,

    this.child,
  });

  final double? width;
  final double? height;

  // Rahmen & Glow
  final double borderRadius;
  final double strokeWidth;
  final double glowWidthFactor;
  final double glowSigma;
  final double glowOpacity;
  final double borderOpacity;

  // Gradient
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final double gradientRotation;

  // Inhalt
  final Color panelColor;
  final EdgeInsets padding;
  final ImageProvider? backgroundImage;
  final double backgroundOpacity;
  final BoxFit backgroundFit;
  final Alignment backgroundAlignment;

  // Neu
  final bool childScrollable;
  final Alignment childAlignment;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding,
      child: child == null
          ? const SizedBox.shrink()
          : (childScrollable
          ? SingleChildScrollView(child: child!)
          : Align(alignment: childAlignment, child: child)),
    );

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // 1) Weicher Glow
          Positioned.fill(
            child: CustomPaint(
              painter: _NeonBorderPainter(
                radius: borderRadius,
                strokeWidth: strokeWidth * glowWidthFactor,
                blurSigma: glowSigma,
                colors: gradientColors,
                stops: gradientStops,
                rotation: gradientRotation,
                opacity: glowOpacity,
              ),
            ),
          ),
          // 2) Scharfer Rand
          Positioned.fill(
            child: CustomPaint(
              painter: _NeonBorderPainter(
                radius: borderRadius,
                strokeWidth: strokeWidth,
                blurSigma: 0,
                colors: gradientColors,
                stops: gradientStops,
                rotation: gradientRotation,
                opacity: borderOpacity,
              ),
            ),
          ),
          // 3) Fläche + (Hintergrundbild -> Inhalt)
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(borderRadius > 0 ? strokeWidth + 2 : strokeWidth),
              child: ClipRRect(
                borderRadius: BorderRadius.circular((borderRadius - 1).clamp(0, 999).toDouble()),
                child: Container(
                  color: panelColor,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (backgroundImage != null)
                        Opacity(
                          opacity: backgroundOpacity.clamp(0.0, 1.0),
                          child: Image(
                            image: backgroundImage!,
                            fit: backgroundFit,
                            alignment: backgroundAlignment,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      content,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeonBorderPainter extends CustomPainter {
  _NeonBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.blurSigma,
    required this.colors,
    required this.stops,
    required this.rotation,
    required this.opacity,
  });

  final double radius;
  final double strokeWidth;
  final double blurSigma;
  final List<Color> colors;
  final List<double> stops;
  final double rotation;
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth / 2),
      Radius.circular(radius),
    );

    final shader = SweepGradient(
      colors: colors.map((c) => c.withOpacity(opacity)).toList(),
      stops: stops,
      startAngle: 0,
      endAngle: math.pi * 2,
      transform: GradientRotation(rotation),
    ).createShader(rect);

    final paint = Paint()
      ..shader = shader
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    if (blurSigma > 0) {
      paint.maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    }

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _NeonBorderPainter old) {
    return radius != old.radius ||
        strokeWidth != old.strokeWidth ||
        blurSigma != old.blurSigma ||
        rotation != old.rotation ||
        opacity != old.opacity ||
        colors != old.colors ||
        stops != old.stops;
  }
}
