import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/theme/theme.dart';
import 'data/services/authentication.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}

Future<void> initServices() async {
  await GetStorage.init();
  await Get.putAsync(() => AuthenticationService().init());
}
