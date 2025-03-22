class ValidateCheck {
  static String? validateEmptyText(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  static String? validatePassword(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    } else if (value.length < 8) {
      return 'minimum password is 8 character';
    }
    return null;
  }
}
