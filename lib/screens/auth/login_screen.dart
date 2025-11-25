import '../home/main_menu.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart'; // ඊළඟට හදන Sign Up පිටුව
import 'forgot_password.dart'; // ඊළඟට හදන Forgot Password පිටුව

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // පාස්වර්ඩ් එක පේනවද නැද්ද බලන ස්විච් එක

  @override
  Widget build(BuildContext context) {
    // Screen එකේ උස සහ පළල ලබාගැනීම
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Keyboard එක ආවම Screen එක උඩට යන්න
        child: Column(
          children: [
            // 1. Top Green Wavy Background
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3, // Screen එකෙන් 30% ක් උස
              child: Image.asset(
                'assets/images/auth_top_shape.png', // උඩ හැඩය
                fit: BoxFit.cover,
              ),
            ),

            // 2. Login Form Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Center(
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // --- Email Field ---
                  const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none, // ඉරි නැතුව
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- Password Field ---
                  const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: !_isPasswordVisible, // True නම් තරු ලකුණු, False නම් අකුරු
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

                  // --- Forgot Password Link ---
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF1B3B2B),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- Sign In Button ---
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // 1. ඉස්සෙල්ලම Print එක (Debug කරන්න ලේසියි)
                        debugPrint("Login Clicked");

                        // 2. ඊට පස්සේ Main Menu එකට යන්න
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainMenuScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B3B2B), // Dark Green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- Social Icons (Optional) ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Icon
                      _buildSocialIcon('assets/images/google.png'),
                      const SizedBox(width: 20),
                      // Facebook Icon (Example)
                      _buildSocialIcon('assets/images/fb.png'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // --- Sign Up Link ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignupScreen())
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF1B3B2B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // Bottom Spacing
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Social Icons හදන පොඩි Widget එකක්
  Widget _buildSocialIcon(String assetName) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(
        assetName,
        height: 30,
        width: 30,
        // පින්තූරේ නැත්නම් Error එයි, ඒ නිසා Icon එකක් දාන්න පුළුවන් ඕන නම්:
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );
  }
}