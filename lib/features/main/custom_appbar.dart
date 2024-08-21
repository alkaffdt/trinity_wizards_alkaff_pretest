import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';

const double _appbarHeight = 70;

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppbar(
      {super.key,
      this.padding = const EdgeInsets.only(left: 16),
      required this.title,
      this.isProfile = false});

  final String title;
  final bool isProfile;

  final EdgeInsets padding;

  final actions = [
    GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10).copyWith(right: 24),
        child: const Text("Logout")
            .bold()
            .textColor(ConstColors.blue)
            .fontSize(16),
      ),
    )
  ];

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
        padding: padding,
        child: Text(title).bold(),
      ),
      actions: isProfile ? actions : null,
    );
  }
}
