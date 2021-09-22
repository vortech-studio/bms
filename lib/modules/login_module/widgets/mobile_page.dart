import 'package:bms/core/util/helpers.dart';
import 'package:bms/core/values/colors.dart';
import 'package:bms/global_widgets/custom_button.dart';
import 'package:bms/global_widgets/custom_text_field.dart';
import 'package:bms/modules/login_module/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller.dart';

class LoginMobilePage extends GetView<LoginController> {
  const LoginMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          SvgPicture.asset('assets/images/logo.svg'),
          const SizedBox(height: 32.0),
          GetX<LoginController>(
            init: LoginController(),
            builder: (_) => _.isEnteringPinCode
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: const [
                        PinCodeField(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: null,
                            child: Text(
                              'Resend OTP',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomTextField(
                    hintText: 'Phone Number',
                    text: 'Phone Number',
                    isPassword: false,
                    horizontalMargin: MediaQuery.of(context).size.width * .125,
                    onChanged: (value) =>
                        Get.find<LoginController>().phoneNumber = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (isValidPhoneNumber(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
          ),
          const Spacer(),
          CustomButton(
            label: 'Next',
            onPressed: () {
              var controller = Get.find<LoginController>();
              controller.isEnteringPinCode == false
                  ? controller.isEnteringPinCode = true
                  : Get.offAndToNamed('/accountSetup');
            },
            backgroundColor: primaryColor,
            horizontalMargin: MediaQuery.of(context).size.width * .25,
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
