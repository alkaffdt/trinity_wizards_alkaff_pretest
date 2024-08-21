import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/utils/common_utils.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

class BaseProfilePicture extends StatelessWidget {
  const BaseProfilePicture(this.contact,
      {super.key, this.widget, this.size = 113});
  final Contact? contact;

  final double size;

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    late String profilPictureStr;

    if (contact != null) {
      profilPictureStr = CommonUtils.generateProfilePicture(
          firstName: contact?.firstName ?? "",
          lastName: contact?.lastName ?? "");
    }

    return Container(
      height: size,
      width: size,
      decoration:
          const BoxDecoration(color: ConstColors.blue, shape: BoxShape.circle),
      child: Center(
        child: contact != null
            ? Text(profilPictureStr)
                .fontSize(30)
                .fontWeight(FontWeight.w300)
                .textColor(Colors.white)
            : const Icon(
                Icons.person_2_outlined,
                color: Colors.white,
                size: 55,
              ),
      ),
    );
  }
}
