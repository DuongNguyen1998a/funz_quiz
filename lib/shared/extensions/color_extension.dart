import 'package:flutter/material.dart';

extension ExtenthedColorTheme on BuildContext {
  ColorExtension get colorTheme => Theme.of(this).extension<ColorExtension>()!;
}

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color backgroundColor;
  final Color primaryColor;
  final Color whiteColor;
  final Color grayColor;
  final Color greenColor;
  final Color redColor;

  const ColorExtension({
    required this.backgroundColor,
    required this.primaryColor,
    required this.whiteColor,
    required this.grayColor,
    required this.greenColor,
    required this.redColor,
  });

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? backgroundColor,
    Color? primaryColor,
    Color? whiteColor,
    Color? grayColor,
    Color? greenColor,
    Color? redColor,
  }) {
    return ColorExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      whiteColor: whiteColor ?? this.whiteColor,
      grayColor: grayColor ?? this.grayColor,
      greenColor: greenColor ?? this.greenColor,
      redColor: redColor ?? this.redColor,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other is! ColorExtension) {
      return this;
    }
    return ColorExtension(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t) ?? whiteColor,
      grayColor: Color.lerp(grayColor, other.grayColor, t) ?? grayColor,
      greenColor: Color.lerp(greenColor, other.greenColor, t) ?? greenColor,
      redColor: Color.lerp(redColor, other.redColor, t) ?? redColor,
    );
  }

  static const light = ColorExtension(
    backgroundColor: Color(0xFFF7EBE1),
    primaryColor: Color(0xFFE9956A),
    whiteColor: Color(0xFFFDFBFD),
    grayColor: Color(0xFF8B8887),
    greenColor: Color(0xFF4C756E),
    redColor: Color(0xFFCE6262),
  );
}
