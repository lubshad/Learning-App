import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: defaultAnimationDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (value * 100).toInt().toString() + "%",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            defaultSpacerSmall,
            LinearProgressIndicator(
              value: value,
              color: Color.lerp(warningColor, successColor, value),
              backgroundColor: successColor.withOpacity(.2),
            ),
          ],
        ),
      ),
    );
  }
}
