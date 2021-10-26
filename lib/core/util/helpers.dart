import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (phoneNumber.isEmpty) {
    return 'Please enter your phone number';
  } else if (!regExp.hasMatch(phoneNumber)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String formattedPhoneNumber(String phoneNumber) {
  if (phoneNumber.startsWith('0')) {
    return '+254' + phoneNumber.replaceFirst('0', '');
  } else {
    return '+' + phoneNumber;
  }
}

void showSnackBar({
  required String title,
  required String message,
  required Color backgroundColor,
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(16.0),
    maxWidth: 300.0,
    snackPosition: SnackPosition.BOTTOM,
  );
}
