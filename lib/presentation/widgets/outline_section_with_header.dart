import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class OutlineSectionWithHeader extends StatelessWidget {
  const OutlineSectionWithHeader({
    Key? key,
    required this.heading,
    required this.child,
    this.trailing,
  }) : super(key: key);

  final String heading;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      padding: const EdgeInsets.symmetric(
          vertical: defaultPadding, horizontal: defaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: trailing == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.headline6,
              ),
              if (trailing != null) trailing!,
            ],
          ),
          defaultSpacer,
          child,
        ],
      ),
    );
  }
}
