import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/login_screen/login_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bold_headline_5.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/text_with_underlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
      ),
      body: AnimatedBuilder(
        animation: loginScreenController,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Form(
                key: loginScreenController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: defaultPadding * 3,
                    ),
                    BoldHeadline5(text: AppLocalizations.of(context)!.login),
                    const SizedBox(
                      height: defaultPadding * 4,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value!.isEmpty
                            ? AppLocalizations.of(context)!.empty_phone_number
                            : value.length != 9
                                ? AppLocalizations.of(context)!
                                    .invalid_phone_number
                                : null;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(9),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                      controller: loginScreenController.phoneNumberController,
                      decoration: InputDecoration(
                          label:
                              Text(AppLocalizations.of(context)!.phone_number),
                          prefixText:
                              AppLocalizations.of(context)!.country_code + " "),
                    ),
                    defaultSpacer,
                    DefaultButton(
                        text: AppLocalizations.of(context)!.send_otp,
                        onPressed: () {
                          if (loginScreenController.validate()) {
                            loginScreenController.sendOtp();
                          }
                        },
                        isLoading: loginScreenController.buttonLoading),
                    const SizedBox(
                      height: defaultPadding * 3,
                    ),
                    TextWithUnderlindedTextButton(
                        text: AppLocalizations.of(context)!.no_account_question,
                        buttonText: AppLocalizations.of(context)!.register,
                        onPressed: () {
                          Get.until(
                              (route) => Get.currentRoute == RouteList.initial);
                          Get.toNamed(RouteList.register);
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
