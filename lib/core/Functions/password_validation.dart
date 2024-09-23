String? passwordValidation(String? value) {
  if (value?.isEmpty ?? true) {
    return "Required Field";
  } else {
    List<String> messages = [];
    if (value!.length < 8) {
      messages.add("Password must be at least 8 characters long.");
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      messages.add("Password must contain at least one uppercase letter.");
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      messages.add("Password must contain at least one lowercase letter.");
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      messages.add("Password must contain at least one digit.");
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      messages.add(
          r"Password must contain at least one special character (!@#$&*~).");
    }

    if (messages.isNotEmpty) {
      return "Password validation failed:\n${messages.join("\n")}";
    } else {
      return null;
    }
  }
}
