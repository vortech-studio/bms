import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double horizontalMargin;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.horizontalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        color: backgroundColor,
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: Text(label,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              )),
        ),
      ),
    );
  }
}
