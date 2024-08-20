import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/utils/common_utils.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

class ContactItemView extends StatelessWidget {
  const ContactItemView(this.contact, {super.key});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ConstColors.darkGray)),
      padding: const EdgeInsets.symmetric(vertical: 11.33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProfilePicture(contact),
          8.toHeightGap(),
          Text("${contact.firstName} ${contact.lastName}")
              .fontSize(13)
              .textColor(Colors.black54)
        ],
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture(this.contact);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    const double size = 113;

    final profilPictureStr = CommonUtils.generateProfilePicture(
        firstName: contact.firstName ?? "", lastName: contact.lastName ?? "");

    return Container(
      height: size,
      width: size,
      decoration:
          const BoxDecoration(color: ConstColors.blue, shape: BoxShape.circle),
      child: Center(
        child: Text(profilPictureStr)
            .fontSize(30)
            .fontWeight(FontWeight.w300)
            .textColor(Colors.white),
      ),
    );
  }
}
