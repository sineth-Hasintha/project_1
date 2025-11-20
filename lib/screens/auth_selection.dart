import 'package:flutter/material.dart';

class AuthSelectionScreen extends StatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  State<AuthSelectionScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<AuthSelectionScreen> {
  bool isGuide = false; // False = Tourist, True = Guide

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image changes based on toggle
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    isGuide
                        ? "assets/images/adventure_bg.jpg"
                        : "assets/images/tourist_bg.jpg"
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay for readability
          Container(color: Colors.black.withOpacity(0.3)),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(), // Pushes content to bottom

                // Dynamic Title
                Text(
                  isGuide ? "Lead The Adventure" : "Explore New Horizons",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isGuide
                      ? "You hold the key to hidden mysteries. Sign in to begin."
                      : "Discover hidden mysteries and unlock experiences beyond imagination.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),

                // Sign In Button
                _buildButton(
                    text: "SIGN IN",
                    color: const Color(0xFF1B3B2B),
                    textColor: Colors.white
                ),
                const SizedBox(height: 16),

                // Sign Up Button
                _buildButton(
                    text: "SIGN UP",
                    color: const Color(0xFF1B3B2B).withOpacity(0.8),
                    textColor: Colors.white
                ),

                const SizedBox(height: 40),

                // Bottom Toggle (Tourist | Guide)
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildToggleOption("Tourist", !isGuide),
                        const SizedBox(width: 20),
                        Container(width: 1, height: 15, color: Colors.white),
                        const SizedBox(width: 20),
                        _buildToggleOption("Guide", isGuide),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for the toggle text
  Widget _buildToggleOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isGuide = (text == "Guide");
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  // Helper for the big buttons
  Widget _buildButton({required String text, required Color color, required Color textColor}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}