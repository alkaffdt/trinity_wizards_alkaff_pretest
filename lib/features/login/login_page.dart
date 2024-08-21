import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/app_dialogs.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/base_textfield.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/cta_button.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/states/auth_state.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/home_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/auth_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/main/main_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
        authProvider.select(
          (value) => value.status,
        ), (prev, next) {
      if (next == AuthenticationStatus.authenticated) {
        AppDialog.showSuccessMessage(context, message: "Access Granted...");

        Future.delayed(const Duration(milliseconds: 1111), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainPage()));
        });
      } else if (next == AuthenticationStatus.unauthenticated) {
        AppDialog.showSuccessMessage(context,
            icon: Icons.disabled_by_default_rounded,
            iconColor: ConstColors.red,
            message: "Access Denied...");

        Future.delayed(const Duration(milliseconds: 1000), () {
          ref.invalidate(authProvider);
        });
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            75.toHeightGap(),
            const Text("Hi There")
                .fontSize(16)
                .textColor(ConstColors.blue)
                .medium(),
            const Text("Please login to see your contact list")
                .fontSize(16)
                .textColor(ConstColors.grayText),
            //
            //
            49.toHeightGap(),
            const _UserIdTextField(),
            45.toHeightGap(),
            const _LoginButton()
          ],
        ),
      ),
    );
  }
}

class _UserIdTextField extends ConsumerWidget {
  const _UserIdTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        ref.watch(authProvider.notifier).userIdTextController;

    return BaseTextField(
      textController: textController,
      onChanged: (value) {
        //
      },
      title: "User ID",
      isRequired: true,
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CtaButton(
      text: "Login",
      onPressed: () {
        ref.read(authProvider.notifier).logIn();
      },
    );
  }
}
