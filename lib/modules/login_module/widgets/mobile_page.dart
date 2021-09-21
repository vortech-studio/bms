import 'package:bms/core/util/helpers.dart';
import 'package:bms/core/values/colors.dart';
import 'package:bms/global_widgets/custom_button.dart';
import 'package:bms/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller.dart';

class LoginMobilePage extends StatelessWidget {
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
          CustomTextField(
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
          const Spacer(),
          CustomButton(
            label: 'Next',
            onPressed: () {},
            backgroundColor: primaryColor,
            horizontalMargin: MediaQuery.of(context).size.width * .25,
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
