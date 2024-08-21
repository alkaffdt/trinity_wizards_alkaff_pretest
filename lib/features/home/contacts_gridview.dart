import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contact_card_view.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';

class ContactsGridview extends ConsumerWidget {
  const ContactsGridview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(contactListControllerProvider);
    final list = ref.watch(contactListControllerProvider);

    return RefreshIndicator(
      onRefresh: () => ref
          .read(contactListControllerProvider.notifier)
          .gatherContactsFromJson(),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ContactItemView(list[index]);
        },
      ),
    );
  }
}
