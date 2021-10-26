// ignore_for_file: avoid_print

import 'package:bms/core/util/helpers.dart';
import 'package:bms/data/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _phoneNumber = ''.obs;
  set phoneNumber(value) => _phoneNumber.value = value;
  get phoneNumber => _phoneNumber.value;

  final _isEnteringPinCode = false.obs;
  set isEnteringPinCode(value) => _isEnteringPinCode.value = value;
  get isEnteringPinCode => _isEnteringPinCode.value;

  final _code = ''.obs;
  set code(value) => _code.value = value;
  get code => _code.value;

  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  AuthenticationService authenticationService =
      Get.find<AuthenticationService>();

  late ConfirmationResult confirmationResult;

  void sendOTP() {
    authenticationService
        .webVerifyPhoneNumber(formattedPhoneNumber(phoneNumber))
        .then((value) {
      confirmationResult = value;
      isEnteringPinCode = true;
    });
  }

  void verifyOTP() {
    authenticationService
        .webVerifySmsCode(confirmationResult, code)
        .then((value) => Get.offAndToNamed('/accountSetup'))
        .catchError((error) {
      FirebaseAuthException e = error as FirebaseAuthException;
      showSnackBar(
          backgroundColor: Colors.red, message: e.code, title: 'Error');
    });
  }
}
