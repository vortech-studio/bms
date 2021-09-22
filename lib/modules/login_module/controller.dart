import 'package:get/get.dart';

class LoginController extends GetxController {
  final _phoneNumber = ''.obs;
  set phoneNumber(value) => _phoneNumber.value = value;
  get phoneNumber => _phoneNumber.value;

  final _isEnteringPinCode = false.obs;
  set isEnteringPinCode(value) => _isEnteringPinCode.value = value;
  get isEnteringPinCode => _isEnteringPinCode.value;
}
