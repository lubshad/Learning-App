import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class BoldHeadline5 extends StatelessWidget {
  const BoldHeadline5({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5BoldBlack(),
    );
  }
}
