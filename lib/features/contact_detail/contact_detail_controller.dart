import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/utils/common_validators.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/states/contact_detail_state.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/features/login/auth_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

final contactDetailControllerProvider =
    StateNotifierProvider<ContactDetailController, ContactDetailState>((ref) {
  return ContactDetailController(
      ref.watch(contactListControllerProvider.notifier),
      authController: ref.watch(authProvider.notifier));
});

class ContactDetailController extends StateNotifier<ContactDetailState> {
  ContactDetailController(this.contactsListController,
      {required this.authController})
      : super(ContactDetailState());

  final ContactsListController contactsListController;
  final AuthController authController;
  Contact? contact;

  TextEditingController firstNameTextCtr = TextEditingController();
  TextEditingController lastNameTextCtr = TextEditingController();
  TextEditingController emailTextCtr = TextEditingController();
  TextEditingController dateOfBirthTextCtr = TextEditingController();

  void loadContact(Contact selectedContact) {
    contact = selectedContact;

    //
    firstNameTextCtr.text = contact?.firstName ?? "";
    lastNameTextCtr.text = contact?.lastName ?? "";
    emailTextCtr.text = contact?.email ?? "";
    dateOfBirthTextCtr.text = contact?.dob ?? "";

    //
    state = state.copyWith(
      firstName: firstNameTextCtr.text,
      lastName: lastNameTextCtr.text,
      email: emailTextCtr.text,
      dateOfBirth: dateOfBirthTextCtr.text,
    );
  }

  void createNewContact() {
    final randomUniqueId =
        DateTime.now().millisecondsSinceEpoch.remainder(100000).toString();

    final newContact = Contact(
        id: lastNameTextCtr.text + randomUniqueId + firstNameTextCtr.text,
        firstName: firstNameTextCtr.text,
        lastName: lastNameTextCtr.text,
        email: emailTextCtr.text,
        dob: dateOfBirthTextCtr.text);

    contactsListController.createNewContact(newContact);
  }

  void removeContact() {
    contactsListController.removeContact(contact?.id ?? "");
  }

  void updateContact() {
    final updatedContact = Contact(
        id: contact?.id ?? "",
        firstName: firstNameTextCtr.text,
        lastName: lastNameTextCtr.text,
        email: emailTextCtr.text,
        dob: dateOfBirthTextCtr.text);

    //
    contactsListController.updateContact(updatedContact);
    updateAuthProfile(updatedContact);
  }

  void updateAuthProfile(Contact updatedContact) {
    final isAuthProfile = authController.profile.id == contact?.id;

    if (isAuthProfile) {
      authController.updateProfile(updatedContact);
    }
  }

  void onChangedFirstName() {
    state = state.copyWith(firstName: firstNameTextCtr.text);
  }

  void onChangedLastName() {
    state = state.copyWith(lastName: lastNameTextCtr.text);
  }

  void onChangedEmail() {
    state = state.copyWith(email: emailTextCtr.text);
  }

  void onChangedDateOfBirth() {
    state = state.copyWith(dateOfBirth: dateOfBirthTextCtr.text);
  }

  bool isValidated() {
    final isEmailValidated = CommonValidator.validateEmail(state.email);

    final isNameValidated =
        state.firstName.isNotEmpty && state.lastName.isNotEmpty;

    return isEmailValidated && isNameValidated;
  }
}
