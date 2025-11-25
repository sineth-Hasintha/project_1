import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // අංක විතරක් ටයිප් කරන්න දෙන්න
import 'new_password.dart'; // ඊළඟට හදන අන්තිම පිටුව (Reset Password)

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
            Navigator.pop(context); // ආපහු යන්න
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // --- Title ---
            const Text(
              "Verification",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 15),

            // --- Subtitle ---
            const Text(
              "Please Enter the '4' Digit Code Sent to\nexample@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 50),

            // --- OTP Inputs (කොටු 4) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // කොටු අතර ඉඩ සමව බෙදන්න
              children: [
                _buildOTPBox(context, first: true, last: false),
                _buildOTPBox(context, first: false, last: false),
                _buildOTPBox(context, first: false, last: false),
                _buildOTPBox(context, first: false, last: true),
              ],
            ),

            const SizedBox(height: 40),

            // --- Resend Code ---
            GestureDetector(
              onTap: () {
                print("Resend Code Clicked");
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(
                  color: Color(0xFF1B3B2B),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // --- VERIFY Button ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // ඊළඟට අලුත් Password එක දාන පිටුවට යන්න
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const NewPasswordScreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3B2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "VERIFY",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // OTP Box එකක් හදන Helper Widget එක
  Widget _buildOTPBox(BuildContext context, {required bool first, required bool last}) {
    return Container(
      height: 60,
      width: 60, // කොටුවේ ප්‍රමාණය
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05), // මෘදු ඡායාවක්
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus(); // අංකයක් ගැහුවම ඊළඟ කොටුවට යන්න
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus(); // මැකුවම පස්සට එන්න
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number, // අංක විතරයි
        maxLength: 1, // එක කොටුවක එක අංකයයි
        decoration: const InputDecoration(
          counter: Offstage(), // යටින් එන character counter එක හංගන්න
          border: InputBorder.none,
        ),
      ),
    );
  }
}