import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class GradiantIconButton extends StatelessWidget {
  const GradiantIconButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.size = defaultPadding * 3,
    this.gradiant = defaultGradiant,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final double size;
  final Gradient gradiant;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      width: size,
      height: size,
      child: IconButton(
          onPressed: onPressed, icon: child, splashRadius: size * .75),
      decoration: BoxDecoration(
          boxShadow: defaultShadow, shape: BoxShape.circle, gradient: gradiant),
      duration: defaultAnimationDuration,
    );
  }
}
