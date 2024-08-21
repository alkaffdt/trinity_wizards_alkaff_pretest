import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/base_profile_picture.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/base_textfield.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/components/cta_button.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/utils/common_validators.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/contact_detail_cta.dart';
import 'package:trinity_wizards_alkaff_pretest/features/main/custom_appbar.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key, this.contact});
  final Contact? contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppbar(title: "Contact Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 24)
            .copyWith(bottom: 45),
        child: Column(
          children: [
            const Expanded(child: _FormView()),
            24.toHeightGap(),
            const ContactDetailCta(),
          ],
        ),
      ),
    );
  }
}

class _FormView extends ConsumerWidget {
  const _FormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contact = ref.watch(contactDetailControllerProvider.notifier).contact;
    return ListView(
      children: [
        // Profile Picture
        BaseProfilePicture(contact),
        47.toHeightGap(),
        //
        //
        // Mandatory fields
        const Text("Main Information")
            .italic()
            .fontSize(15)
            .textColor(ConstColors.blue),
        8.toHeightGap(),
        const Divider(
          height: 0.5,
        ),
        10.toHeightGap(),
        const _FirstNameField(),
        12.toHeightGap(),
        const _LastNameField(),
        //
        //
        // Optional Fields
        26.toHeightGap(),
        const Text("Sub Information")
            .italic()
            .fontSize(15)
            .textColor(ConstColors.blue),
        8.toHeightGap(),
        const Divider(
          height: 0.5,
        ),
        10.toHeightGap(),
        const _EmailField(),
        12.toHeightGap(),
        const _DateOfBirthField()
      ],
    );
  }
}

class _FirstNameField extends ConsumerWidget {
  const _FirstNameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        ref.watch(contactDetailControllerProvider.notifier).firstNameTextCtr;

    return BaseTextField(
      textController: textController,
      isRequired: true,
      title: "First Name",
      hint: "Enter First Name",
      prefixWidget: const Icon(
        Icons.person_2_outlined,
        color: ConstColors.blue,
      ),
      onChanged: (text) {
        ref.read(contactDetailControllerProvider.notifier).onChangedFirstName();
      },
    );
  }
}

class _LastNameField extends ConsumerWidget {
  const _LastNameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        ref.watch(contactDetailControllerProvider.notifier).lastNameTextCtr;

    return BaseTextField(
      textController: textController,
      isRequired: true,
      title: "Last Name",
      hint: "Enter Last Name",
      prefixWidget: const Icon(
        Icons.person_2_outlined,
        color: ConstColors.blue,
      ),
      onChanged: (text) {
        ref.read(contactDetailControllerProvider.notifier).onChangedLastName();
      },
    );
  }
}

class _EmailField extends ConsumerWidget {
  const _EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        ref.watch(contactDetailControllerProvider.notifier).emailTextCtr;

    return BaseTextField(
      textController: textController,
      title: "Email",
      hint: "Enter Email",
      prefixWidget: const Icon(
        Icons.mail_outline,
        color: ConstColors.blue,
      ),
      onChanged: (text) {
        ref.read(contactDetailControllerProvider.notifier).onChangedEmail();
      },
    );
  }
}

class _DateOfBirthField extends ConsumerWidget {
  const _DateOfBirthField({super.key});

  final String title = "Date Of Birth";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        ref.watch(contactDetailControllerProvider.notifier).dateOfBirthTextCtr;

    return BaseTextField(
      textController: textController,
      title: title,
      hint: "Enter $title",
      prefixWidget: const Icon(
        Icons.calendar_month_outlined,
        color: ConstColors.blue,
      ),
      onChanged: (text) {
        ref
            .read(contactDetailControllerProvider.notifier)
            .onChangedDateOfBirth();
      },
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then(
          (value) {
            final formatter = DateFormat('dd/MM/yyyy');
            textController.text = formatter.format(value ?? DateTime.now());
          },
        );
      },
    );
  }
}
