import 'package:flutter/material.dart';

class TextWithUnderlindedTextButton extends StatelessWidget {
  const TextWithUnderlindedTextButton({
    Key? key, required this.text, required this.buttonText, required this.onPressed,
  }) : super(key: key);

  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                  decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}