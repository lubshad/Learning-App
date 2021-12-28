import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/app_logo.dart';

import 'components/login_or_register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              top: size.height / 3,
              // top: authScreenController.isLoading
              // ? size.height / 2 - defaultPadding * 4
              // : defaultPadding * 4,
              duration: const Duration(seconds: 2),
              curve: Curves.ease,
              child: const AppLogo(),
            ),
            Positioned(
                top: size.height / 2,
                right: defaultPadding,
                left: defaultPadding,
                bottom: defaultPadding,
                child: const LoginOrRegister()),
          ],
        ),
      ),
    ));
  }
}
