import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';

class AppBottomNavbar extends StatelessWidget {
  const AppBottomNavbar(
      {super.key, required this.selectedIndex, required this.onTap});

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: '',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: ConstColors.blue,
      onTap: onTap,
    );
  }
}
