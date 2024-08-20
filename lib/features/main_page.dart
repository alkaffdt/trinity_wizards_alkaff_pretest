import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/bottom_navbar.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/floating_action_button.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/home_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];

  final appbarTitles = ["My Contacts", "My Profile"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final floatingActionButton =
        _selectedIndex == 0 ? const AppFloatingActionButton() : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(appbarTitles[_selectedIndex]).bold(),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar:
          AppBottomNavbar(selectedIndex: _selectedIndex, onTap: _onItemTapped),
      floatingActionButton: floatingActionButton,
    );
  }
}
