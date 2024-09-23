String? emailValidation(String? value) {
  if (value?.isEmpty ?? true) {
    return "Required Field";
  } else {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (!emailValid) {
      return "This Email is Invalid !! ";
    } else {
      return null;
    }
  }
}
