import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: ColorExtension.light.backgroundColor,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    extensions: [
      ColorExtension.light,
    ],
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.resolveWith((state) {
        if (state.contains(MaterialState.selected)) {
          return GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600);
        }
        return GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600);
      }),
    ),
  );
}
