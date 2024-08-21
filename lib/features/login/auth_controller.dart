import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trinity_wizards_alkaff_pretest/features/contact_detail/states/auth_state.dart';
import 'package:trinity_wizards_alkaff_pretest/features/home/contacts_list_controller.dart';
import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.watch(contactListControllerProvider.notifier))
    ..checkSavedAuth();
});

class AuthController extends StateNotifier<AuthState> {
  AuthController(this.contactsListController) : super(AuthState());

  TextEditingController userIdTextController = TextEditingController();

  final ContactsListController contactsListController;

  final key = "authAccess";

  void logIn() {
    // 5c8a80f5437a24a66ac7e0c5
    final authContact =
        contactsListController.findContact(userIdTextController.text);

    if (authContact == null) {
      state = state.copyWith(status: AuthenticationStatus.unauthenticated);
      return;
    }

    // then encrypt & save it to device's storage
    saveAuth();
    //
    state = state.copyWith(
        profile: authContact, status: AuthenticationStatus.authenticated);
  }

  void saveAuth() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(key, userIdTextController.text);
  }

  void checkSavedAuth() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // final isSaved = sharedPreferences.containsKey(key);

    final access = sharedPreferences.getString(key);

    if (access != null) {
      userIdTextController.text = access;

      logIn();
    }
  }
}
