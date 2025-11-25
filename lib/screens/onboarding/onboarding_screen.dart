import 'package:flutter/material.dart';
import '../auth/role_selection.dart'; // ඊළඟට අපි හදන ෆයිල් එක (Error එකක් ආවොත් ගණන් ගන්න එපා)

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  // ඔයාගේ අලුත් Figma Design එකේ විස්තර ටික
  final List<Map<String, String>> _contents = [
    {
      "image": "assets/images/onboard_1.png",
      "title": "Discover the world.\nYour way.",
      "desc": "Unforgettable trips await your tap."
    },
    {
      "image": "assets/images/onboard_2.png", // Guide ඉන්න පින්තූරේ
      "title": "Meet your perfect\nLocal Guide",
      "desc": "Get personalized tours and insider tips from guides who live where you're going."
    },
    {
      "image": "assets/images/onboard_3.png", // VR පින්තූරේ
      "title": "Experience it\nbefore you go.",
      "desc": "Step into your destination with immersive VR. See the sights before you even arrive!"
    },
    {
      "image": "assets/images/onboard_4.png", // Mood based එක
      "title": "Mood-based\nDestinations.\nJust for You",
      "desc": "Happy, relaxed, or adventurous. We'll find a place that matches your vibe."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // සම්පූර්ණ Screen එකම
      body: Stack(
        children: [
          // 1. Background Images (Slider)
          PageView.builder(
            controller: _controller,
            itemCount: _contents.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_contents[index]['image']!),
                    fit: BoxFit.cover, // පින්තූරේ Screen එක පුරාම
                  ),
                ),
                // අඳුරු ඡායාවක් දාන්න ඕන නම් මේ කෑල්ල තියන්න, නැත්නම් මකන්න
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.2)],
                    ),
                  ),
                ),
              );
            },
          ),

          // 2. Bottom White Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 350, // කාඩ් එකේ උස
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    _contents[_currentIndex]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B2B), // තද කොළ පාට
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Description
                  Text(
                    _contents[_currentIndex]['desc']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),

                  const Spacer(), // ඉතුරු ඉඩ ටික පුරවන්න

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentIndex == _contents.length - 1) {
                          // අන්තිම පිටුව නම් -> Role Selection එකට යන්න
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const RoleSelectionScreen())
                          );
                        } else {
                          // ඊළඟ පිටුවට යන්න
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B3B2B), // තද කොළ පාට
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Skip Button
                  TextButton(
                    onPressed: () {
                      // කෙලින්ම Role Selection එකට පනින්න
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const RoleSelectionScreen())
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}