import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'screens/home_screen.dart';

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
