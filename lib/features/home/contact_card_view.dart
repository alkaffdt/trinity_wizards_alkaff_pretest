import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/base_profile_picture.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/utils/common_utils.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/auth_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

class ContactItemView extends ConsumerWidget {
  const ContactItemView(this.contact, {super.key});
  final Contact contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(contactDetailControllerProvider.notifier).loadContact(contact);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactDetailPage(contact: contact)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ConstColors.darkGray)),
        padding: const EdgeInsets.symmetric(vertical: 11.33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseProfilePicture(contact),
            8.toHeightGap(),
            _ContactName(contact)
          ],
        ),
      ),
    );
  }
}

class _ContactName extends ConsumerWidget {
  _ContactName(this.contact, {super.key});

  Contact contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMyProfile =
        ref.watch(authProvider.notifier).isAuthProfile(contact.id);
    final currentTextTheme = Theme.of(context).textTheme;

    final name = "${contact.firstName} ${contact.lastName}";

    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text: TextSpan(
        text: name,
        style: currentTextTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 14),
        children: <TextSpan>[
          if (isMyProfile)
            const TextSpan(
              text: "(you)",
              style: TextStyle(
                  color: ConstColors.darkGray, fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );

    // return Text(
    //   name,
    //   maxLines: 2,
    //   overflow: TextOverflow.ellipsis,
    // ).fontSize(13).textColor(Colors.black54).center();
  }
}
