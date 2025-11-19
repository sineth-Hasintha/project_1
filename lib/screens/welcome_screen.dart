import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding.dart'; // ඔයාගේ Onboarding page එක මේ නමින් තියෙන්න ඕන

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // තත්පර 5කින් Onboarding එකට යනවා
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image (ශ්‍රී ලංකාවේ පින්තූරයක්)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1585171328560-947fbd92d6f0?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // සීගිරියේ හෝ ලස්සන පින්තූරයක්
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Dark Overlay (පින්තූරේ උඩින් කළු පාට gradient එකක්)
          // මේක දාන්නේ අකුරු පැහැදිලිව පේන්න
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                  ],
              ),
            ),
          ),

          // 3. Text Content and Loader
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo Icon (Optional)
                Icon(
                    Icons.travel_explore,
                    color: Colors.white,
                    size: 60
                ),

                SizedBox(height: 20),

                // Main Title
                Text(
                  "HIDMO",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 4.0,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 10.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),

                // Subtitle
                Text(
                  "Explore the Wonder of Asia",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 50),

                // Loading Indicator
                CircularProgressIndicator(
                  color: Colors.greenAccent, // ශ්‍රී ලංකාවේ කොළ පාට
                ),
              ],
            ),
          ),

          // Bottom Copyright Text
          const Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}