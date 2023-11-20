import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funz_quiz/router/quiz_router.dart';
import 'package:funz_quiz/screens/auth/login/login_bloc.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:funz_quiz/shared/ui/story_book.dart';
import 'package:funz_quiz/shared/values/strings.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (!state.isLoading && state.isLoginSuccess) {
            context.go(QuizRouter.quiz);
          } else {}
        },
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return QuizScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.loginTitle,
                    style: GoogleFonts.poppins().copyWith(fontSize: 60, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  QuizPrimaryButton(
                    onPressed: () => _googleLogin(bloc),
                    text: Strings.loginWithGoogle,
                    left: SvgPicture.asset('assets/icons/ic_google_login.svg', width: 32, height: 32),
                    right: state.isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: context.colorTheme.primaryColor,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _googleLogin(LoginBloc bloc) async {
    await bloc.googleLogin();
  }
}
