import 'package:bms/core/values/colors.dart';
import 'package:bms/core/values/strings.dart';
import 'package:bms/global_widgets/custom_button.dart';
import 'package:bms/global_widgets/custom_text_field.dart';
import 'package:bms/modules/account_setup_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSetupMobilePage extends GetView<AccountSetupController> {
  const AccountSetupMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
        title: Text(accountSetupTitle,
            style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: CustomTextField(
                hintText: userNameHintText,
                text: userNameHintText,
                isPassword: false,
                textInputType: TextInputType.name,
                horizontalMargin: MediaQuery.of(context).size.width * .125,
                onChanged: (value) =>
                    Get.find<AccountSetupController>().userName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a user name';
                  }
                  if (value.length < 3) {
                    return 'Please enter a valid user name';
                  }
                  return null;
                }),
          )),
          CustomButton(
              label: 'Next',
              onPressed: () {},
              backgroundColor: primaryColor,
              horizontalMargin: MediaQuery.of(context).size.width * .25),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
