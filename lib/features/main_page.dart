import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/bottom_navbar.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/home_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar:
          AppBottomNavbar(selectedIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
