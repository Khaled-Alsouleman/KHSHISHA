import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';
import '../data/menu_items.dart';
import '../widgets/category_card.dart';
import '../widgets/GlowText.dart';
import '../widgets/NeonGlowPanel.dart';
import 'CategoryScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            final logoW = (c.maxWidth * 0.8).clamp(160.0, 350.0).toDouble();

            final edgeMargin = getValueForScreenType<double>(
              context: context,
              mobile: 4.sw,
              tablet: 5.sw,
              desktop: 6.sw,
            );

            final panelWidth =
            (c.maxWidth - 2 * edgeMargin).clamp(280.0, c.maxWidth).toDouble();
            final panelHeight = getValueForScreenType<double>(
              context: context,
              mobile: 30.sh,
              tablet: 40.sh,
              desktop: 25.sh,
            );

            final columns = getValueForScreenType<int>(
              context: context,
              mobile: 1,
              tablet: 2,
              desktop: 2,
            );
            final cardHeight = getValueForScreenType<double>(
              context: context,
              mobile: 125,
              tablet: 220,
              desktop: 240,
            );

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Particles(
                        awayRadius: 150,
                        particles: _createParticles(),
                        height: screen.height,
                        width: screen.width,
                        onTapAnimation: true,
                        awayAnimationDuration: const Duration(milliseconds: 100),
                        awayAnimationCurve: Curves.linear,
                        enableHover: true,
                        hoverRadius: 90,
                        connectDots: false,
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/Logo.png',
                                width: logoW,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                              const SizedBox(height: 12),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: edgeMargin),
                                child: NeonGlowPanel(
                                  width: panelWidth,
                                  height: panelHeight,
                                  borderRadius: 16,
                                  strokeWidth: 2,
                                  glowWidthFactor: 2.0,
                                  glowSigma: 24,
                                  glowOpacity: 0.9,
                                  borderOpacity: 1.0,
                                  gradientColors: const [
                                    Color(0xFF7DD3FC),
                                    Color(0xFF34D399),
                                    Color(0xFFF59E0B),
                                    Color(0xFF7DD3FC),
                                  ],
                                  gradientStops: const [0.0, 0.42, 0.78, 1.0],
                                  panelColor: const Color(0xFF0F0F10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  backgroundImage:
                                  const AssetImage('assets/images/dance.jpg'),
                                  backgroundOpacity: 0.20,
                                  backgroundFit: BoxFit.cover,
                                  childScrollable: true,
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 2),
                                        GlowText(
                                          'Montag bis Donnerstag',
                                          textAlign: TextAlign.center,
                                          textColor: Colors.white,
                                          glowColor: Colors.blueAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 5),
                                        GlowText(
                                          '16:00 bis 00:00 Uhr',
                                          textColor: Colors.white,
                                          glowColor: Colors.blueAccent,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 5),
                                        GlowText(
                                          textAlign: TextAlign.start,
                                          'Freitag bis Sonntag',
                                          textColor: Colors.white,
                                          glowColor: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 5),
                                        GlowText(
                                          textAlign: TextAlign.start,
                                          '16:00 bis 05:00 Uhr',
                                          textColor: Colors.white,
                                          glowColor: Colors.red,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    GlowText(
                                      'Menü',
                                      glowColor: Colors.purpleAccent,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Divider(color: Colors.white),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 12,
                                    tablet: 16,
                                    desktop: 65,
                                  ),
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: menuItems.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: columns,
                                    mainAxisExtent: cardHeight,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                  ),
                                  itemBuilder: (context, index) {
                                    final it = menuItems[index];
                                    return CategoryCard(
                                      title: it.title,         // GlowText
                                      imagePath: it.imagePath, // String
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_) => it.child),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Particle> _createParticles() {
    final rng = Random();
    return List.generate(
      140,
          (_) => Particle(
        color: Colors.white.withOpacity(0.4),
        size: rng.nextDouble() * 8,
        velocity: Offset(
          rng.nextDouble() * 15 * (rng.nextBool() ? 1 : -1),
          rng.nextDouble() * 100 * (rng.nextBool() ? 1 : -1),
        ),
      ),
    );
  }
}
