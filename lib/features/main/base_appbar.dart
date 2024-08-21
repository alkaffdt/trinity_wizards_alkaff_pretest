import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/auth_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/login_page.dart';

const double _appbarHeight = 70;

class BaseAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const BaseAppbar(
      {super.key,
      this.padding = const EdgeInsets.only(left: 16),
      required this.title,
      this.isProfile = false});

  final String title;
  final bool isProfile;

  final EdgeInsets padding;

  @override
  Size get preferredSize => const Size.fromHeight(_appbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = [
      GestureDetector(
        onTap: () {
          ref.read(authProvider.notifier).logOut();

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));

          ref.invalidate(authProvider);
        },
        child: Padding(
          padding: const EdgeInsets.all(10).copyWith(right: 24),
          child: const Text("Logout")
              .bold()
              .textColor(ConstColors.blue)
              .fontSize(16),
        ),
      )
    ];

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
