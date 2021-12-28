import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
        // borderRadius: BorderRadius.circular(defaultPadding),
        child: Hero(
      tag: "logo",
      // child: Image.asset(
      //   "assets/logo.png",
      //   width: defaultPadding * 8,
      //   height: defaultPadding * 8,
      // )
      child: FlutterLogo(
        size: 100,
      ),
    ));
  }
}
