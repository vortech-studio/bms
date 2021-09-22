import 'package:bms/modules/login_module/widgets/mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/desktop_page.dart';

class LoginPage extends GetResponsiveView {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    switch (screen.screenType) {
      case ScreenType.Phone:
        return const LoginMobilePage();
      default:
        return const LoginDesktopPage();
    }
  }
}
