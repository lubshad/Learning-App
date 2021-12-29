import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/screens/auth_screen/auth_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthScreenController authScreenController = Get.find();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Sign In",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: primaryColor),
            ),
            defaultSpacer,
            Text(
              "By using out service you are agreeing to our",
              style: Theme.of(context).textTheme.caption,
            ),
            defaultSpacerSmall,
            Text(
              "Terms and Privacy Statement",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            DefaultButton(
                text: "Sign in with google",
                onPressed: authScreenController.loginWithGoogle,
                isLoading: authScreenController.googleButtonLoading),
            defaultSpacerSmall,
            DefaultButton(
                text: "Sign in with Email", onPressed: () {}, isLoading: false),
            defaultSpacerSmall,
            DefaultButton(
                text: "Sign in with Facebook",
                onPressed: () {},
                isLoading: false),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New here?"),
                TextButton(onPressed: () {}, child: const Text("Sign Up"))
              ],
            ),
            defaultSpacer,
          ],
        ),
      ),
      //     body: SingleChildScrollView(
      //   child: SizedBox(
      //     height: size.height,
      //     width: size.width,
      //     child: Stack(
      //       alignment: Alignment.center,
      //       children: [
      //         AnimatedPositioned(
      //           top: size.height / 3,
      //           // top: authScreenController.isLoading
      //           // ? size.height / 2 - defaultPadding * 4
      //           // : defaultPadding * 4,
      //           duration: const Duration(seconds: 2),
      //           curve: Curves.ease,
      //           child: const AppLogo(),
      //         ),
      //         Positioned(
      //             top: size.height / 2,
      //             right: defaultPadding,
      //             left: defaultPadding,
      //             bottom: defaultPadding,
      //             child: const LoginOrRegister()),
      //       ],
      //     ),
      //   ),
      // )
    );
  }
}
