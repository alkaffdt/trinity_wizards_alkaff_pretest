class Contact {
  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
  });

  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;

  Contact copyWith({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) {
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dob: dob ?? this.dob,
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      dob: json["dob"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dob": dob,
      };
}
