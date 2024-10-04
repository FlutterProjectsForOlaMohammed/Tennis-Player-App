String? phoneNumberValidation(String? value) {
  if (value?.isEmpty ?? true) {
    return "Required Field ";
  }
  if (value!.length != 11) {
    return "it must be 11 numbers";
  }
  if (value.substring(0, 3) == "010" ||
      value.substring(0, 3) == "011" ||
      value.substring(0, 3) == "012" ||
      value.substring(0, 3) == "015") {
    return null;
  } else {
    return "Your Number Must Begin With 010 / 011 / 012 / 015";
  }
}
