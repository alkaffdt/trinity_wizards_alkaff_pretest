import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/base_profile_picture.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/cta_button.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_page.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/auth_controller.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfile = ref.watch(authProvider.select(
      (value) => value.profile!,
    ));

    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.toHeightGap(),
          BaseProfilePicture(myProfile),
          10.toHeightGap(),
          Text("${myProfile.firstName ?? ''} ${myProfile.lastName ?? ''}"),
          10.toHeightGap(),
          Text(myProfile.email ?? ""),
          10.toHeightGap(),
          Text(myProfile.dob ?? ""),
          24.toHeightGap(),
          CtaButton(
            text: "Update My Detail",
            onPressed: () {
              ref
                  .read(contactDetailControllerProvider.notifier)
                  .loadContact(myProfile);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactDetailPage(contact: myProfile)));
            },
          )
        ],
      ),
    );
  }
}
