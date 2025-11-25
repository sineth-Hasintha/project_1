import 'package:flutter/material.dart';
import 'login_screen.dart'; // ඊළඟට අපි හදන Login පිටුව

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image (Green Tunnel)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/role_bg.png'), // ඔයාගේ Assets වල මේ නමින් පින්තූරේ තියෙන්න ඕන
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Content (Buttons at the bottom)
          Positioned(
            bottom: 100, // පහළ සිට ඇති දුර
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Tourist Button ---
                _buildRoleButton(
                  icon: Icons.person, // මනුස්සයෙක්ගේ අයිකන් එක
                  label: "Tourist",
                  onTap: () {
                    // Tourist කෙනෙක් විදිහට Login එකට යන්න
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                ),

                const SizedBox(width: 50), // බොත්තම් දෙක අතර පරතරය

                // --- Local Guide Button ---
                _buildRoleButton(
                  icon: Icons.business_center, // Guide කෙනෙක් වගේ අයිකන් එකක්
                  label: "Local Guide",
                  onTap: () {
                    // Guide කෙනෙක් විදිහට Login එකට යන්න
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // බොත්තම් දෙක එක වගේ නිසා අපි පොඩි Helper කෑල්ලක් හැදුවා (Code එක අඩු කරගන්න)
  Widget _buildRoleButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // සුදු පාට රවුම
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, size: 40, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          // යටින් තියෙන නම
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}