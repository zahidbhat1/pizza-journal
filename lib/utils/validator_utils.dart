class ValidatorUtils {
  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isNameValid(String name) {
    return RegExp(r"^[a-zA-Z0-9@']").hasMatch(name);
  }
}
