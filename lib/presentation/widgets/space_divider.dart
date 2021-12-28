import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class SpaceDivider extends StatelessWidget {
  const SpaceDivider({
    Key? key,
    this.size = defaultPadding * .2,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      color: greyColor,
    );
  }
}
