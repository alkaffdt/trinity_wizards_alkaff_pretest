import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/cta_button.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';

class ContactDetailCta extends ConsumerWidget {
  const ContactDetailCta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(contactDetailControllerProvider);

    final isCreateNewContact =
        ref.watch(contactDetailControllerProvider.notifier).contact == null;

    final isValidated =
        ref.watch(contactDetailControllerProvider.notifier).isValidated();

    return Column(
      children: [
        if (isCreateNewContact)
          CtaButton(
            text: "Save",
            onPressed: isValidated
                ? () {
                    ref
                        .read(contactDetailControllerProvider.notifier)
                        .createNewContact();

                    Navigator.pop(context);
                  }
                : null,
          )
        else ...[
          CtaButton(
            text: "Update",
            onPressed: isValidated
                ? () {
                    ref
                        .read(contactDetailControllerProvider.notifier)
                        .updateContact();

                    Navigator.pop(context);
                  }
                : null,
          ),
          16.toHeightGap(),
          CtaButton(
            backgroundColor: Colors.white,
            text: "Remove",
            foregroundColor: ConstColors.red,
            borderColor: ConstColors.red,
            fontWeight: FontWeight.w100,
            onPressed: () {
              ref
                  .read(contactDetailControllerProvider.notifier)
                  .removeContact();

              Navigator.pop(context);

              // show popup/snackbar
            },
          )
        ]
      ],
    );
  }
}
