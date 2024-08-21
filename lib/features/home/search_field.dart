import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';

class SearchContactField extends ConsumerWidget {
  const SearchContactField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(contactListControllerProvider.notifier).searchFieldController;

    return TextField(
      controller: controller,
      onChanged: (value) {
        ref.read(contactListControllerProvider.notifier).searchOnChange();
      },
    );
  }
}
