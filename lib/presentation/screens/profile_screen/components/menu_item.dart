import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/logout_user.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'menu_list_items.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MenuListItems(
              text: AppLocalizations.of(context)!.my_orders,
              onTap: () {},
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.my_address,
              onTap: () {},
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.my_wishlist,
              onTap: () {},
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.logout,
              onTap: () {
                Get.find<AuthenticationLocalDataSource>().deleteUser();
              },
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
