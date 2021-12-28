import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'components/menu_item.dart';
import 'components/profile_head.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgLightBlue,
        title: Text(
          AppLocalizations.of(context)!.account,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * .5),
        child: Column(
          children: [
            defaultSpacer,
            ProfileHead(userEntity: authController.user!),
            defaultSpacer,
            const MenuItem()
          ],
        ),
      ),
    );
  }
}
