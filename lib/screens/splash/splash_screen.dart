import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:funz_quiz/router/quiz_router.dart';
import 'package:funz_quiz/screens/splash/splash_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!state.isLoading && state.isAuthenticated) {
              debugPrint('[SplashScreen] authenticated');
              context.go(QuizRouter.quiz);
            } else {
              debugPrint('[SplashScreen] not authenticated');
              context.go(QuizRouter.login);
            }
            FlutterNativeSplash.remove();
          });
          return Container(color: Colors.white);
        },
      ),
    );
  }
}
