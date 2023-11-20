import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class QuizScaffold extends StatelessWidget {
  final Widget body;

  const QuizScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

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
            child: body,
          ),
        ],
      ),
    );
  }
}
