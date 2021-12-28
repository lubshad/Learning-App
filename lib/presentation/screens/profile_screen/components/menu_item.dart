import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/logout_user.dart';
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
              onTap: () => Get.toNamed(RouteList.myOrders),
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.my_address,
              onTap: () => Get.toNamed(RouteList.myAddressScreen),
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.my_wishlist,
              onTap: () => Get.toNamed(RouteList.wishList),
            ),
            MenuListItems(
              text: AppLocalizations.of(context)!.logout,
              onTap: () {
                Get.find<LogoutUser>()(NoParams());
              },
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
