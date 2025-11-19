import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Import the welcome screen

void main() {
  runApp(const HidmoApp());
}

class HidmoApp extends StatelessWidget {
  const HidmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidmo Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1B3B2B),
        scaffoldBackgroundColor: Colors.white,
      ),
      // Start the app at WelcomeScreen
      home: const WelcomeScreen(),
    );
  }
}