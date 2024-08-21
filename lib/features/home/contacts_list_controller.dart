import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

final contactListControllerProvider =
    StateNotifierProvider<ContactsListController, List<Contact>>((ref) {
  return ContactsListController()..init();
});

class ContactsListController extends StateNotifier<List<Contact>> {
  ContactsListController() : super([]);

  TextEditingController searchFieldController = TextEditingController();

  List<Contact> masterData = [];

  void init() {
    gatherContactsFromJson();
  }

  void gatherContactsFromJson() async {
    final String response =
        await rootBundle.loadString('assets/datas/contacts.json');
    final data = await json.decode(response) as List;

    final contactsList = data
        .map(
          (e) => Contact.fromJson(e),
        )
        .toList();

    masterData = contactsList;
    state = contactsList;
  }

  void searchOnChange() {
    final keyword = searchFieldController.text.toLowerCase();

    state = masterData
        .where(
          (element) =>
              // filter contact whether first or last name contains the keyword
              (element.firstName ?? "").toLowerCase().contains(keyword) ||
              (element.lastName ?? "").toLowerCase().contains(keyword),
        )
        .toList();
  }

  void createNewContact(Contact newContact) {
    List<Contact> list = List.from(state);

    list.insert(0, newContact);

    //update master
    masterData = list;
    state = list;
  }

  void updateContact(Contact updatedContact) {
    List<Contact> list = List.from(state);

    int selectedIndex = list.indexWhere(
      (element) => element.id == updatedContact.id,
    );

    list[selectedIndex] = updatedContact;

    //update master
    masterData = list;
    state = list;
  }

  void removeContact(String contactId) {
    var list = List<Contact>.from(state);

    list.removeWhere(
      (element) => element.id == contactId,
    );

    //update master
    masterData = list;
    state = list;
  }
}
