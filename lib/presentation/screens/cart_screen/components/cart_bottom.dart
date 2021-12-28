import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bill_name_with_price.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({
    Key? key,
    required this.billDetailsEntity,
  }) : super(key: key);

  final BillDetailsEntity billDetailsEntity;

  @override
  Widget build(BuildContext context) {
    CartScreenController cartScreenController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // BillNameWithPrice(
          //     billType: AppLocalizations.of(context)!.item_total,
          //     price: billDetailsEntity.itemTotal!),
          // defaultSpacerSmall,
          // BillNameWithPrice(
          //     billType: AppLocalizations.of(context)!.delivery_charge,
          //     price: billDetailsEntity.deliveryCharge!),
          // defaultSpacerSmall,
          BillNameWithPrice(
              billType: AppLocalizations.of(context)!.total,
              price: billDetailsEntity.total),
          defaultSpacer,
          DefaultButton(
            isLoading: false,
            onPressed: () {
              if (cartScreenController.checkStockAvailbilty) {
                Get.toNamed(RouteList.checkout,
                    arguments:
                        cartScreenController.viewCartResponseModel!.cartId);
              } else {
                showMessage(
                    AppLocalizations.of(context)!.some_item_not_in_stock);
              }
            },
            text: AppLocalizations.of(context)!.checkout,
          )
        ],
      ),
    );
  }
}
