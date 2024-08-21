import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_gridview.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/search_contact_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: Column(
        children: [
          // top margin
          10.toHeightGap(),
          const SearchContactField(),
          const Expanded(child: ContactsGridview())
        ],
      ),
    );
  }
}
