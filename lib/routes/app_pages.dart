import 'package:bms/modules/account_setup_module/page.dart';
import 'package:bms/modules/login_module/binding.dart';
import 'package:bms/modules/login_module/page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.accountSetup,
      page: () => AccountSetupPage(),
      binding: LoginBinding(),
    )
  ];
}
