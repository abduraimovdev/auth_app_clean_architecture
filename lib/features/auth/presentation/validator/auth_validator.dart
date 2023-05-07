class AuthValidator {
    static String? isNameValid(String? text) {
    if (text != null && text.length >= 8) {
      return null;
    } else {
      return "Name in not valid";
    }
  }
    static String? isEmailValid(String? text) {
    if (text != null && text.length >= 8) {
      return null;
    } else {
      return "Email in not valid";
    }
  }

  static String? isPasswordValid(String? text) {
    if (text != null && text.length >= 8) {
      return null;
    } else {
      return "Password in not valid";
    }
  }
}
