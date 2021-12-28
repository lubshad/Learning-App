import 'package:learning_app/l10n/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../verify_otp_controller.dart';

class VerifyOtpForm extends StatelessWidget {
  const VerifyOtpForm({
    Key? key,
    required this.verifyOtpController,
  }) : super(key: key);

  final VerifyOtpController verifyOtpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: verifyOtpController.formKey,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: verifyOtpController.otpController,
        validator: (value) {
          return value!.isEmpty
              ? AppLocalizations.of(context)!.please_enter_your_otp
              : value.length != 6
                  ? AppLocalizations.of(context)!.please_enter_your_4_digit_otp
                  : null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration:
            InputDecoration(label: Text(AppLocalizations.of(context)!.otp)),
      ),
    );
  }
}
