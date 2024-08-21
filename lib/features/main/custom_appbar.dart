import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';

const double _appbarHeight = 70;

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppbar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(_appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      bottomOpacity: 1,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(title).bold(),
      ),
    );
  }
}
