import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  // මේකෙන් තමයි යට තියෙන Bottom Bar එකේ Active එක තෝරන්නේ
  int _selectedIndex = 0;

  // Grid එකේ දාන්න ඕන විස්තර ටික ලිස්ට් එකක් විදිහට හැදුවා
  final List<Map<String, String>> _menuItems = [
    {"title": "Guides", "image": "assets/images/menu_guides.jpg"},
    {"title": "Discover", "image": "assets/images/menu_discover.jpg"},
    {"title": "Events", "image": "assets/images/menu_events.jpg"},
    {"title": "Plans", "image": "assets/images/menu_plans.jpg"},
    {"title": "Equipment", "image": "assets/images/menu_equip.jpg"},
    {"title": "Mood Picks", "image": "assets/images/menu_mood.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F9F2), // Header එකේ ලා කොළ පාට
      body: SafeArea(
        bottom: false, // යට කොටස සුදු පාටින් කවර් වෙන්න ඕන නිසා
        child: Column(
          children: [
            // --- 1. Top Header Area (Hi Chris) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Chris",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B3B2B),
                        ),
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  // Avatar Image
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/user_avatar.jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

            // --- 2. White Container with Rounded Top ---
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // --- Search Bar ---
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            "Search",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // --- Grid Menu ---
                    Expanded(
                      child: GridView.builder(
                        itemCount: _menuItems.length,
                        physics: const BouncingScrollPhysics(), // Scroll වෙද්දී පොඩි ගැම්මක් එන්න
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // පේළියකට කාඩ් 2යි
                          crossAxisSpacing: 15, // හරස් පරතරය
                          mainAxisSpacing: 15, // උඩ පරතරය
                          childAspectRatio: 0.8, // කාඩ් එකේ උස/පළල අනුපාතය (උස වැඩියි)
                        ),
                        itemBuilder: (context, index) {
                          return _buildMenuCard(
                            _menuItems[index]['title']!,
                            _menuItems[index]['image']!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // --- 3. Custom Bottom Navigation Bar ---
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFFE5F9F2), // යට පසුබිම ලා කොළ පාටමයි
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40), // රවුම් හැඩය
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_filled, 0),
              _buildNavItem(Icons.location_on_outlined, 1),
              _buildNavItem(Icons.notifications_none, 2),
              _buildNavItem(Icons.menu, 3),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widget: Grid Card ---
  Widget _buildMenuCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // අඳුරු ඡායාවක් පහළින් (Text එක පේන්න)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Pill Shaped Button Label
          Positioned(
            bottom: 15,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8), // වීදුරු වගේ පෙනුම
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget: Bottom Nav Item ---
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 30,
        color: isSelected ? Colors.black : Colors.grey, // Select වුනාම කළු පාට
      ),
    );
  }
}