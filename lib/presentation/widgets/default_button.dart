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
    this.borderRadius = defaultPadding * .3,
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

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.black,
    this.height = defaultPadding * 2.5,
    this.borderRadius = defaultPadding * .3,
    required this.loginType,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final SocialLoginType loginType;

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
                backgroundColor: MaterialStateProperty.all(whiteColor),
              ),
              onPressed: isLoading ? () {} : onPressed,
              child: AnimatedSwitcher(
                duration: defaultAnimationDuration,
                child: isLoading
                    ? LoadingWidget(color: textColor)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              loginType.logo(),
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          defaultSpacerHorizontalSmall,
                          Text(
                            text,
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
              )),
        )),
      ],
    );
  }
}

enum SocialLoginType {
  google,
  email,
  facebook,
}

extension SocialLoginTypeExtension on SocialLoginType {
  String logo() {
    switch (this) {
      case SocialLoginType.google:
        return "assets/google.png";
      case SocialLoginType.email:
        return "assets/email.png";
      case SocialLoginType.facebook:
        return "assets/facebook.png";
    }
  }
}
