import 'package:flutter/material.dart';
import 'package:funz_quiz/screens/auth/login/login_screen.dart';
import 'package:funz_quiz/screens/main_tab_screen.dart';
import 'package:funz_quiz/screens/quiz_tab/quiz_screen.dart';
import 'package:funz_quiz/screens/ranking_tab/ranking_screen.dart';
import 'package:funz_quiz/screens/splash/splash_screen.dart';
import 'package:funz_quiz/screens/you_tab/you_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorQuizKey = GlobalKey<NavigatorState>(debugLabel: 'Quiz');
final _shellNavigatorRankingKey = GlobalKey<NavigatorState>(debugLabel: 'Ranking');
final _shellNavigatorYouKey = GlobalKey<NavigatorState>(debugLabel: 'You');

class QuizRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String quiz = '/quiz';
  static const String ranking = '/ranking';
  static const String you = '/you';

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splash,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainTabScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorQuizKey,
            routes: [
              GoRoute(
                path: quiz,
                builder: (context, state) => const QuizScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRankingKey,
            routes: [
              GoRoute(
                path: ranking,
                builder: (context, state) => const RankingScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorYouKey,
            routes: [
              GoRoute(
                path: you,
                builder: (context, state) => const YouScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
