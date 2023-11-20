import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/ui/story_book.dart';
import 'package:funz_quiz/shared/values/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.quizTitle,
              style: GoogleFonts.poppins().copyWith(fontSize: 60, fontWeight: FontWeight.bold, height: 1.2),
            ),
            QuizPrimaryButton(
              onPressed: () {},
              text: Strings.startPlaying,
              left: const Icon(
                CupertinoIcons.arrow_right,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
