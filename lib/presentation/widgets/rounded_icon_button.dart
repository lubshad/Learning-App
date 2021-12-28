import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
            boxShadow: defaultShadow),
        child: IconButton(
            padding: EdgeInsets.zero, icon: Icon(icon), onPressed: onPressed));
  }
}
