import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/desktop_page.dart';
import 'widgets/mobile_page.dart';

class AccountSetupPage extends GetResponsiveView {
  AccountSetupPage({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    switch (screen.screenType) {
      case ScreenType.Phone:
        return const AccountSetupMobilePage();
      default:
        return const AccountSetupDesktopPage();
    }
  }
}
