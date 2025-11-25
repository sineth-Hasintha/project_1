import 'package:flutter/material.dart';
import 'login_screen.dart'; // Sign In එකට ආපහු යන්න ඕන නිසා

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false; // පාස්වර්ඩ් පේනවද නැද්ද
  bool _isAgreed = false; // Terms වලට එකඟද නැද්ද (Checkbox)

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Top Green Wavy Background (Login එකේ වගේමයි)
            SizedBox(
              width: double.infinity,
              height: size.height * 0.25, // Login එකට වඩා චුට්ටක් උස අඩුයි
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/auth_top_shape.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Back Button (Login එකට යන්න)
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // ආපහු පස්සට යන්න
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 2. Sign Up Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Create your Account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Username ---
                  _buildLabel("Username"),
                  _buildTextField("John Doe", false),

                  const SizedBox(height: 15),

                  // --- Email ---
                  _buildLabel("Email"),
                  _buildTextField("example@gmail.com", false),

                  const SizedBox(height: 15),

                  // --- Password ---
                  _buildLabel("Password"),
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "...............",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- Terms & Conditions Checkbox ---
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        activeColor: const Color(0xFF1B3B2B),
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value!;
                          });
                        },
                      ),
                      Expanded( // Text එක දිග වැඩි වුණොත් කඩලා ගන්න
                        child: RichText(
                          text: const TextSpan(
                            text: "Agree with ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Terms and Conditions",
                                style: TextStyle(
                                  color: Color(0xFF1B3B2B),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // --- Sign Up Button ---
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isAgreed) {
                          // Terms වලට එකඟ නම් විතරක් Sign Up වෙන්න
                          print("Sign Up Clicked!");
                        } else {
                          // නැත්නම් Message එකක් දෙන්න
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please agree to Terms first!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B3B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- Already have an account? ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Login එකට යන්න
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xFF1B3B2B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TextField හදන Helper Function එක (Code එක කෙටි කරගන්න)
  Widget _buildTextField(String hint, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Label හදන Helper Function එක
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}