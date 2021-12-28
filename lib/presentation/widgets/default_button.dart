import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

import 'loading_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
    this.textColor = whiteColor,
    this.height = defaultPadding * 2.5,
    this.borderRadius = defaultPadding * .5,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: height,
          child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                ),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              onPressed: isLoading ? () {} : onPressed,
              child: AnimatedSwitcher(
                duration: defaultAnimationDuration,
                child: isLoading
                    ? LoadingWidget(color: textColor)
                    : Text(
                        text,
                        style: TextStyle(color: textColor),
                      ),
              )),
        )),
      ],
    );
  }
}

class DefaultButtonRounded extends StatelessWidget {
  const DefaultButtonRounded({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding))),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: AnimatedSwitcher(
          duration: defaultAnimationDuration,
          child: isLoading ? const LoadingWidget() : Text(text),
        ));
  }
}
