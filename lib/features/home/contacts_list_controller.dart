import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

final contactListControllerProvider =
    StateNotifierProvider<ContactsListController, List<Contact>>((ref) {
  return ContactsListController()..init();
});

class ContactsListController extends StateNotifier<List<Contact>> {
  ContactsListController() : super([]);

  void init() {
    getContacts();
  }

  void getContacts() async {
    final String response =
        await rootBundle.loadString('assets/datas/contacts.json');
    final data = await json.decode(response) as List;

    final contactsList = data
        .map(
          (e) => Contact.fromJson(e),
        )
        .toList();

    state = contactsList;
  }
}
