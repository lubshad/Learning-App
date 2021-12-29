import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'components/cart_bottom.dart';
import 'components/cart_item_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartScreenController cartScreenController = Get.find();
    cartScreenController.getData();
    return AnimatedBuilder(
      animation: cartScreenController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: cartScreenController.appError,
          loading: cartScreenController.isLoading,
          retry: cartScreenController.getData,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: bgLightBlue,
              title: Text(
                AppLocalizations.of(context)!.cart,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: CartItemList(
              cartScreenController: cartScreenController,
            ),
            bottomNavigationBar: cartScreenController.courseList.isEmpty
                ? const SizedBox.shrink()
                : CartBottom(
                    billDetailsEntity: cartScreenController.billDetailsEntity!,
                  ),
          ),
        );
      },
    );
  }
}
