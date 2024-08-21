import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_page.dart';

class AppFloatingActionButton extends ConsumerWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: ConstColors.blue,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
      onPressed: () {
        ref.invalidate(contactDetailControllerProvider);

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ContactDetailPage()));
      },
    );
  }
}
