import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
        child: Hero(
      tag: "logo",
      child: FlutterLogo(
        size: 100,
      ),
    ));
  }
}
