import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:funz_quiz/shared/values/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: RiveAnimation.asset(
              'assets/anims/shapes.riv',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.quizTitle,
                    style: GoogleFonts.poppins().copyWith(fontSize: 60, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  SizedBox(
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {},
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
                          const Icon(
                            CupertinoIcons.arrow_right,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Strings.startPlaying,
                            style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
