import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message, Color textColor) {
    SnackBar snackBar = SnackBar(
      backgroundColor: context.colorTheme.whiteColor,
      content: Text(
        message,
        style: GoogleFonts.poppins().copyWith(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showPopup(BuildContext context, Widget widget) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
