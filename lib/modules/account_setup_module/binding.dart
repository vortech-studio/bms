import 'package:get/get.dart';

import 'controller.dart';

class AccountSetupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSetupController>(() => AccountSetupController());
  }
}
