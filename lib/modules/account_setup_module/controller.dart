import 'package:get/get.dart';

class AccountSetupController extends GetxController {
  final _userName = ''.obs;
  set userName(value) => _userName.value = value;
  get userName => _userName.value;
}
