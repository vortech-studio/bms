import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/helpers.dart';
import '../../../core/values/colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controller.dart';
import 'pin_code_field.dart';

class LoginMobilePage extends GetView<LoginController> {
  const LoginMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: availableHeight,
          child: Form(
            key: Get.find<LoginController>().formKey,
            child: Column(
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
                            children: [
                              const PinCodeField(),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Resend OTP',
                                    style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith()),
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
                          textInputType: TextInputType.phone,
                          horizontalMargin:
                              MediaQuery.of(context).size.width * .125,
                          onChanged: (value) =>
                              Get.find<LoginController>().phoneNumber = value,
                          validator: (value) {
                            return validatePhoneNumber(value!);
                          },
                        ),
                ),
                const Spacer(),
                CustomButton(
                  label: 'Next',
                  onPressed: () {
                    var controller = Get.find<LoginController>();
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.isEnteringPinCode == false) {
                        controller.sendOTP();
                      } else {
                        controller.verifyOTP();
                      }
                    }
                  },
                  backgroundColor: primaryColor,
                  horizontalMargin: MediaQuery.of(context).size.width * .25,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
