import 'package:flutter/material.dart';
import 'verification.dart'; // ඊළඟට අපි හදන OTP ගහන පිටුව

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // ආපහු Login එකට යන්න
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // --- Title ---
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 60),

            // --- Label ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Email Address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // --- Email Input ---
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder( // නිකන් තියෙද්දී Border එක
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder( // Click කරාම Border එක
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF1B3B2B)),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // --- SEND Button ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // ඊළඟට Verification (OTP) පිටුවට යන්න
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VerificationScreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3B2B), // Dark Green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "SEND",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}