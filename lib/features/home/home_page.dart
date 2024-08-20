import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_gridview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // top margin
        10.toHeightGap(),
        25.toHeightGap(),
        const Expanded(child: ContactsListview())
      ],
    );
  }
}
