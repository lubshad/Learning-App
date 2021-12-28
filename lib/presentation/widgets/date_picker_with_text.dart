import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class DatePickerWithText extends StatelessWidget {
  const DatePickerWithText({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.value,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyText1Blue(),
          ),
        ),
      ],
    );
  }
}
