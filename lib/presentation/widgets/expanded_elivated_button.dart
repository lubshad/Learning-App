import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ExpandedElivatedButton extends StatelessWidget {
  const ExpandedElivatedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: defaultPadding / 1.4))),
            onPressed: () => onPressed(),
            child: Text(text)));
  }
}
