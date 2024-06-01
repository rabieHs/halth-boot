class AuthValidation {
  String? validateInput(String? name) {
    if (name == null || name.isEmpty) {
      return "please fill the field";
    }
  }
}
