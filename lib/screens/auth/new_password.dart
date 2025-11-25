import 'package:flutter/material.dart';
import 'login_screen.dart'; // Password එක මාරු කරාට පස්සේ ආයේ Login වෙන්න ඕන නිසා

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  // Password Fields දෙකක් නිසා Variables දෙකක් ඕන
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Keyboard එක ආවම අවුල් නොවෙන්න
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // --- Title ---
              const Center(
                child: Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // --- Subtitle ---
              const Center(
                child: Text(
                  "Your New Password Must Be Different\nfrom Previously Used Password,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // --- New Password Input ---
              const Text("New Password", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                obscureText: !_isNewPasswordVisible,
                decoration: InputDecoration(
                  hintText: "................",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isNewPasswordVisible = !_isNewPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Confirm Password Input ---
              const Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: "................",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // --- SAVE Button ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Password එක Save වුණා කියලා හිතලා Login එකට යවමු
                    // (Back යන්න බැරි වෙන්න pushAndRemoveUntil පාවිච්චි කරනවා)
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false, // පරණ screens ඔක්කොම අයින් කරනවා
                    );

                    // පොඩි Message එකක් දෙමු
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password Reset Successful! Please Login."),
                        backgroundColor: Color(0xFF1B3B2B),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B3B2B), // Dark Green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}