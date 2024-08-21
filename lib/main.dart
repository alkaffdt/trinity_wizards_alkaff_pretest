import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/input_decoration_theme.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/home_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/login_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alkaff - Trinity Wizards',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          // textTheme: GoogleFonts.poppinsTextTheme(),
          inputDecorationTheme: AppTheme.inputDecorationTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: ConstColors.blue),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
