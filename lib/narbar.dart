import 'package:flutter/material.dart';
import 'home_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _page = [
    HomeScreen(),
    Center(child: Text("Discover")),
    Center(child: Text("Shop")),
    Center(child: Text("Manage")),
    Center(child: Text("Vet")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: BottomAppBar(
                color: Colors.green,
                child: SizedBox(
                  // height: ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.explore, "Home", 0),
                      _buildNavItem(Icons.menu_book, "Discover", 1),
                      _buildNavItem(Icons.play_circle_fill, "Shop", 2),
                      _buildNavItem(Icons.category, "Manage", 3),
                      _buildNavItem(Icons.category, "Vet", 4),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildMainContent() {
    return const HomeScreen(); // use the widget I created
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final _isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _isSelected ? const Color(0xFFFFFFFF) : Colors.black,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: _isSelected ? const Color(0xFFFFFFFF) : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
