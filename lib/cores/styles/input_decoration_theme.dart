import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';

class AppTheme {
  static InputDecorationTheme inputDecorationTheme() {
    final defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: ConstColors.blue, width: 0.5));

    return InputDecorationTheme(
      enabledBorder: defaultBorder,
      border: defaultBorder,
      // hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
    );
  }
}
