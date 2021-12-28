import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/screens/change_password_screen/change_password_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_back_button.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangePasswordController changePasswordController = Get.find();
    changePasswordController.clear();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
        leading: const DefaultBackButton(),
        title: const Text("Change Password"),
      ),
      body: AnimatedBuilder(
        animation: changePasswordController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Form(
              key: changePasswordController.formKey,
              child: Column(children: [
                defaultSpacer,
                TextFormField(
                    controller:
                        changePasswordController.currentPasswordController,
                    obscureText: !changePasswordController.passwordVisible,
                    validator: (value) {
                      return value!.isEmpty
                          ? "Enter your current password"
                          : value.length < 6
                              ? "Minimum 6 characters required"
                              : null;
                    },
                    decoration: InputDecoration(
                        label: const Text("Current Password"),
                        suffixIcon: IconButton(
                            icon: Icon(changePasswordController.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: changePasswordController
                                .changePasswordVissibility))),
                defaultSpacerSmall,
                TextFormField(
                    controller: changePasswordController.newPasswordController,
                    obscureText: !changePasswordController.newPasswordVisible,
                    validator: (value) {
                      return value!.isEmpty
                          ? "Enter your new password"
                          : value.length < 6
                              ? "Minimum 6 characters required"
                              : null;
                    },
                    decoration: InputDecoration(
                        label: const Text("New Password"),
                        suffixIcon: IconButton(
                            icon: Icon(
                                changePasswordController.newPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                            onPressed: changePasswordController
                                .changeNewPasswordVissibility))),
                defaultSpacerSmall,
                TextFormField(
                    controller:
                        changePasswordController.confirmPasswordController,
                    obscureText:
                        !changePasswordController.confirmPasswordVisible,
                    validator: (value) {
                      return value!.isEmpty
                          ? "Confirm your password"
                          : changePasswordController
                                      .newPasswordController.text !=
                                  value
                              ? "Password does not match"
                              : null;
                    },
                    decoration: InputDecoration(
                        label: const Text("Confirm Password"),
                        suffixIcon: IconButton(
                            icon: Icon(
                                changePasswordController.confirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                            onPressed: changePasswordController
                                .changeConfirmPasswordVissibility))),
                defaultSpacerSmall,
                DefaultButton(
                    text: "Change Password",
                    onPressed: changePasswordController.changePassword,
                    isLoading: changePasswordController.buttonLoading)
              ]),
            ),
          );
        },
      ),
    );
  }
}
