bool isValidPhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (phoneNumber.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(phoneNumber)) {
    return false;
  }
  return true;
}
