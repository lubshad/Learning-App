import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:get/get.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DefaultButton(
          text: AppLocalizations.of(context)!.login,
          onPressed: () {
            Navigator.of(context).pushNamed(RouteList.login);
          },
          isLoading: false,
        ),
        defaultSpacerSmall,
        DefaultButton(
            text: AppLocalizations.of(context)!.register,
            backgroundColor: whiteColor,
            textColor: blackColor,
            onPressed: () {
              Get.toNamed(RouteList.register);
            },
            isLoading: false),
      ],
    );
  }
}
