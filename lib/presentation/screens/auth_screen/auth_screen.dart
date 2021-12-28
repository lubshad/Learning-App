import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/app_logo.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';

import 'components/login_or_register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "By using out service you are agreeing to our",
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "Terms and Privacy Statement",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            DefaultButton(text: "Sign in", onPressed: () {
              UserEntity userEntity = const UserEntity(name: "Lubshad", sessionId: "123465789", userId: "1", phone: "9744714697", imageUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80");
              Get.find<AuthenticationLocalDataSource>().saveUser(userEntity);
            }, isLoading: false),
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
