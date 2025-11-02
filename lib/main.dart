import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';


void main() {
  runApp(SplashScreenApp());
}

class SplashScreenApp extends StatelessWidget {
  const SplashScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      );
  }
}
