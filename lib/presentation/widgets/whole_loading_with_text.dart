import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWithText extends StatelessWidget {
  const LoadingIndicatorWithText({
    Key? key,
    this.text = "Uploading Documents\nPlease Wait...",
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor.withOpacity(.5),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: whiteColor),
          ),
          const CupertinoActivityIndicator()
        ],
      )),
    );
  }
}
