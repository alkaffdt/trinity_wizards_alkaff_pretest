class CommonUtils {
  static String generateProfilePicture({
    required String firstName,
    required String lastName,
  }) {
    return "${firstName[0]}${lastName[0]}".toUpperCase();
  }
}
