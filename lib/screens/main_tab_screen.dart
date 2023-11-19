import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:go_router/go_router.dart';

class MainTabScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainTabScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: context.colorTheme.whiteColor,
        indicatorColor: context.colorTheme.primaryColor,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: 'Quiz',
            icon: Icon(CupertinoIcons.question_diamond_fill),
          ),
          NavigationDestination(
            label: 'Ranking',
            icon: Icon(CupertinoIcons.arrow_up_arrow_down_circle_fill),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
