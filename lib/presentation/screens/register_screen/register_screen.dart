import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/domain/params/webview_arguments.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/register_screen/register_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/agree_to_terms.dart';
import 'package:learning_app/presentation/widgets/bold_headline_5.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/image_selection_widget.dart';
import 'package:learning_app/presentation/widgets/text_with_underlined_text_button.dart';

import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterScreenController registerScreenController = Get.find();
    registerScreenController.getAllRegions();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
      ),
      body: AnimatedBuilder(
        animation: registerScreenController,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldHeadline5(
                      text: AppLocalizations.of(context)!.create_an_account),
                  defaultSpacer,
                  RegisterForm(
                      registerScreenController: registerScreenController),
                  ImageSelection(
                    title: "Shop Image",
                    removeImage: registerScreenController.removeShopImage,
                    images: registerScreenController.shopImages,
                    addMoreImage: registerScreenController.shopImages.isNotEmpty
                        ? null
                        : registerScreenController.addShopImage,
                  ),
                  defaultSpacer,
                  AgreeToTerms(
                    value: registerScreenController.agreeToTerms,
                    onChange: (value) =>
                        registerScreenController.tougleTermsAndCondition(),
                    onPressed: () {
                      Get.toNamed(RouteList.webView,
                          arguments: const WebViewArguments(
                              title: "Terms and Conditions",
                              url: ApiConstants.termsAndCondition));
                      registerScreenController.makeAgreedToTerms();
                    },
                  ),
                  defaultSpacerSmall,
                  DefaultButton(
                      text: AppLocalizations.of(context)!.send_otp,
                      onPressed: () =>
                          registerScreenController.sendOtp(context),
                      isLoading: registerScreenController.buttonLoading),
                  defaultSpacer,
                  TextWithUnderlindedTextButton(
                    buttonText: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Get.until(
                          (route) => Get.currentRoute == RouteList.initial);
                      Get.toNamed(RouteList.login);
                    },
                    text: AppLocalizations.of(context)!.have_account_question,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
