import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

final contactDetailControllerProvider =
    Provider<ContactDetailController>((ref) {
  return ContactDetailController(
      ref.watch(contactListControllerProvider.notifier));
});

class ContactDetailController {
  ContactDetailController(this.contactsListController);

  final ContactsListController contactsListController;
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

    contactsListController.updateContact(updatedContact);
  }

  void onChangedFirstName() {
    //
  }

  void onChangedLastName() {
    //
  }

  void onChangedEmail() {
    //
  }

  void onChangedDateOfBirth() {
    //
  }
}
