import 'package:flutter/material.dart';

import 'Transaction_view.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate between
  final List<Widget> _screens = [
    HomeScreen(),
    const SettingsScreen(),
    const SizedBox(), // Placeholder for the center scan icon
    ProfileScreen(),
    ChatSupport(),
    Center(child: Text("More Screen")),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
              size: 30,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment_outlined,
              size: 30,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.support_agent_sharp,
              size: 30,
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle scan action here
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.blue[800]!, // Dark blue border color
            width: 3.0, // Border width
          ),
        ),
        elevation: 8.0, // Elevation for shadow effect
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.blue[800], // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
