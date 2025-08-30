import 'dart:math';
import 'package:flutter/material.dart';
import 'package:krautheimer_shisha_bar/screens/classic_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Widgets
import 'package:krautheimer_shisha_bar/widgets/GlowText.dart';
import 'package:krautheimer_shisha_bar/widgets/NeonGlowPanel.dart';

// Dynamischer Hintergrund (Particles)
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 900, tablet: 600, watch: 250),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Krautheimer Shisha Bar',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Krautheimer Shisha Bar'),
      ),
    );
  }
}

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

    // Deine Items für die Karten (unter dem Panel)
    final items = <_CatItem>[
      _CatItem('COCKTAILS\nCLASSIC', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('HIGH BALLSE', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('COCKTAILS\nSTRONG', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('COCKTAILS\nCAIPI', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SOURS', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('FANCY\nDRINK', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('LONGDRINK', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SHOOTERS', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('FLASCHEN', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('BIER', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SEKT &\nWEIN', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('ENERGY\nDRINKS', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SOFTDRINKS', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('HAUSGEMACHTE EISTEE & \nLIMONADE', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('COCKTAILS\nALKOHOLFREI', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SHAKE', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('HEISSE GETRÄNKE', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SNACKS', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SNACKSPIZZA &\nBAGUETTE', 'assets/images/dance.jpg', const ClassicScreen()),
      _CatItem('SHISHA', 'assets/images/dance.jpg', const ClassicScreen()),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            final logoW = (c.maxWidth * 0.8).clamp(160.0, 350.0).toDouble();

            // schmale Seitenränder
            final edgeMargin = getValueForScreenType<double>(
              context: context,
              mobile: 4.sw,
              tablet: 5.sw,
              desktop: 6.sw,
            );

            // feste Panel-Größe
            final panelWidth =
            (c.maxWidth - 2 * edgeMargin).clamp(280.0, c.maxWidth).toDouble();
            final panelHeight = getValueForScreenType<double>(
              context: context,
              mobile: 30.sh,
              tablet: 40.sh,
              desktop: 25.sh,
            );

            // >>> NEU: Maße für Karten (unter dem Panel), responsiv
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
                      // dynamischer Hintergrund
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
                                child: Shimmer(
                                  duration: const Duration(seconds: 2),
                                  interval: const Duration(milliseconds: 800),
                                  color: Colors.white,
                                  colorOpacity: 0.35,
                                  direction: const ShimmerDirection.fromLTRB(),
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
                                    backgroundImage: const AssetImage('assets/images/dance.jpg'),
                                    backgroundOpacity: 0.20,
                                    backgroundFit: BoxFit.cover,
              
                                    // darf gern scrollen, wenn Text mal höher ist:
                                    childScrollable: true,
              
                                    // <<< DEIN INHALT >>>
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GlowText(
                                          'T\u00e4glich',
                                          textColor: Colors.white,
                                          glowColor: Colors.red,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 2),
                                        GlowText(
                                          '16:00 - 19:00',
                                          textColor: Colors.white,
                                          glowColor: Colors.red,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 5),
                                        FittedBox(
                                          child: GlowText(
                                            'HAPPY HOUR',
                                            textColor: Colors.white,
                                            glowColor: Colors.blueAccent,
                                            fontSize: 120,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
              
                              // ============== HIER: CATEGORY CARDS AM ENDE ==============
                              const SizedBox(height: 18),
                              const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    GlowText(
                                      'Menü',
                                      glowColor: Colors.purpleAccent,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                   const Divider(
                                     color: Colors.white,),
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
                                // Grid innerhalb des SingleChildScrollView:
                                // -> shrinkWrap + NeverScrollableScrollPhysics
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: items.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: columns,
                                    mainAxisExtent: cardHeight,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                  ),
                                  itemBuilder: (context, index) {
                                    final it = items[index];
                                    return _CategoryCard(
                                      title: it.title,
                                      imagePath: it.imagePath,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_) => it.child), // direkt Child öffnen
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 24),
                              // ==========================================================
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

// ====== Kleine Card-View (links Text, rechts Bild) ======
class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            color: const Color(0xFF121214),
            borderRadius: radius,
            border: Border.all(color: Colors.white10, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Linke Textseite
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Rechte Bildseite
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    alignment: Alignment.centerRight,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.black26,
                      alignment: Alignment.center,
                      child: const Icon(Icons.photo, color: Colors.white38, size: 36),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ====== Ziel-Screen (einfach) ======
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
              fit: BoxFit.cover,
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

class _CatItem {
  final String title;
  final String imagePath;
  final Widget child;
  _CatItem(this.title, this.imagePath, this.child);
}
