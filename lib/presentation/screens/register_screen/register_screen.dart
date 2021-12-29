import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/register_screen/register_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';

import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterScreenController registerScreenController = Get.find();
    // registerScreenController.getAllRegions();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
      ),
      body: AnimatedBuilder(
        animation: registerScreenController,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
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
                  defaultSpacer,
                  // const Spacer(),
                  RegisterForm(
                      registerScreenController: registerScreenController),

                  defaultSpacer,
                  DefaultButton(
                      text: "Sign In",
                      onPressed: () {
                        registerScreenController.formKey.currentState!
                            .validate();
                      },
                      isLoading: registerScreenController.buttonLoading),
                  defaultSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account?"),
                      TextButton(
                          onPressed: () {
                            Get.until((route) =>
                                Get.currentRoute == RouteList.initial);
                          },
                          child: const Text("Sign Ip"))
                    ],
                  ),
                  defaultSpacer,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
