import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class DefaultPageTransition extends StatelessWidget {
  const DefaultPageTransition({
    Key? key, required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeTransition(
              opacity: animation,
              child: child,
            ),
        child: child);
  }
}