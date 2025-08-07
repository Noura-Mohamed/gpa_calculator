import 'package:flutter/material.dart';
import 'package:gba_calculator/views/splash_screen.dart';

void main() {
  runApp(const GpaCalculator());
}

class GpaCalculator extends StatelessWidget {
  const GpaCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}