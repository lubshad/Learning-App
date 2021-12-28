import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRouteBuilder({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultAnimationDuration,
        );
}

class FadeScaleRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadeScaleRouteBuilder({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeScaleTransition(
              animation: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultAnimationDuration,
        );
}

class DownToTopRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  DownToTopRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultAnimationDuration,
        );
}
