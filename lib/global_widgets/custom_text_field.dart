import 'package:bms/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String text;
  final bool isPassword;
  final double horizontalMargin;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final Function(String?) validator;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.text,
      required this.isPassword,
      required this.horizontalMargin,
      required this.textInputType,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: TextFormField(
        keyboardType: textInputType,
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.bodyText2,
        ),
        obscureText: isPassword,
        validator: (value) => validator(value),
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(26, 20, 4, 20),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: scaffoldBackgroundColor, width: 0.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 0.0),
          ),
        ),
      ),
    );
  }
}
