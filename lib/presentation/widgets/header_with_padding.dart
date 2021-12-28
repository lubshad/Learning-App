import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class HeaderWithPadding extends StatelessWidget {
  const HeaderWithPadding({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
