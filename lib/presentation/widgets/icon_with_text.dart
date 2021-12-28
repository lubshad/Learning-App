import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData iconData;
  const IconWithText({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        defaultSpacerHorizontalSmall,
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1White(),
        ),
      ],
    );
  }
}
