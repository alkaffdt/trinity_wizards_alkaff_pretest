class ContactDetailState {
  ContactDetailState({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.dateOfBirth = "",
  });

  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth;

  ContactDetailState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? dateOfBirth,
  }) {
    return ContactDetailState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
