import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/domain/params/verify_otp_args.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/verify_otp_screen/verify_otp_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bold_headline_5.dart';
import 'package:learning_app/presentation/widgets/text_with_underlined_text_button.dart';
import 'package:learning_app/utils/formaters.dart';

import 'components/verify_otp_form.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyOtpController verifyOtpController = Get.find();
    VerifyOtpArgs verifyOtpArgs = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
      ),
      body: AnimatedBuilder(
        animation: verifyOtpController,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: defaultPadding * 3),
                  BoldHeadline5(
                      text: AppLocalizations.of(context)!
                          .verify_your_phone_number),
                  defaultSpacer,
                  Text(
                    AppLocalizations.of(context)!
                            .an_otp_is_send_to_your_registered_number +
                        " " +
                        obscurePhoneNumber(verifyOtpArgs.phoneNumber),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: defaultPadding * 3),
                  VerifyOtpForm(verifyOtpController: verifyOtpController),
                  defaultSpacer,
                  // DefaultButton(
                  //     text: AppLocalizations.of(context)!.verify_otp,
                  //     onPressed: verifyOtpController.verifyOtp,
                  //     isLoading: verifyOtpController.buttonLoading),
                  defaultSpacer,
                  verifyOtpController.remainingTime > const Duration(seconds: 0)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!
                                .you_can_resend_otp_in),
                            defaultSpacerHorizontalSmall,
                            Text(
                              durationToMs(verifyOtpController.remainingTime),
                              style: const TextStyle(color: errorColor),
                            ),
                          ],
                        )
                      : TextWithUnderlindedTextButton(
                          text: "",
                          buttonText: "Resend OTP",
                          onPressed: verifyOtpController.resendOTP)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
