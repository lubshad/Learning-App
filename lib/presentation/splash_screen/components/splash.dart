import 'package:learning_app/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: AppLogo()),
    );
  }
}
