import 'package:trinity_wizards_alkaff_pretest/models/contact_model.dart';

class AuthState {
  AuthState({
    this.status = AuthenticationStatus.undetermined,
    this.profile,
  });

  final AuthenticationStatus status;
  final Contact? profile;

  AuthState copyWith({
    AuthenticationStatus? status,
    Contact? profile,
  }) {
    return AuthState(
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }
}

enum AuthenticationStatus {
  undetermined,
  authenticated,
  unauthenticated,
  error
}
