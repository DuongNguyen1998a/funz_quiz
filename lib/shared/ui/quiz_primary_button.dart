import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  final Widget? left;
  final Widget? right;

  const QuizPrimaryButton({
    Key? key,
    this.width,
    this.height = 64,
    required this.onPressed,
    required this.text,
    this.left,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.colorTheme.whiteColor),
          surfaceTintColor: MaterialStateProperty.all(context.colorTheme.whiteColor),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return context.colorTheme.backgroundColor;
              return context.colorTheme.whiteColor;
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (left != null) ...[
              left ?? const SizedBox.shrink(),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            if (right != null) ...[
              const SizedBox(width: 8),
              right ?? const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }
}
