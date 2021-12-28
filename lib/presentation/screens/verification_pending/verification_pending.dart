import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bold_headline_5.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPendingScreen extends StatelessWidget {
  const VerificationPendingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 10,
            ),
            Image.asset("assets/ic_success.png"),
            const Spacer(
              flex: 3,
            ),
            const BoldHeadline5(text: "Success !"),
            const Spacer(
              flex: 2,
            ),
            Text(
              AppLocalizations.of(context)!.registration_success_message,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 3,
            ),
            DefaultButton(
                text: "LOGIN",
                onPressed: () {
                  Get.until((route) => Get.currentRoute == RouteList.initial);
                  Get.toNamed(RouteList.login);
                },
                isLoading: false),
            const Spacer(
              flex: 15,
            ),
          ],
        ),
      ),
    );
  }
}
