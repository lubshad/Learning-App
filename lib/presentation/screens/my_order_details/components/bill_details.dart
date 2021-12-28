// ignore_for_file: unrelated_type_equality_checks

import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/presentation/screens/my_order_details/my_order_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bill_name_with_price.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({Key? key, this.billDetailsEntity, this.myOrderListEntity})
      : super(key: key);

  final BillDetailsEntity? billDetailsEntity;
  final MyOrderListEntity? myOrderListEntity;

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.bill_details,
            style: Theme.of(context).textTheme.headline6,
          ),
          defaultSpacerSmall,
          BillNameWithPrice(
            billType: AppLocalizations.of(context)!.item_total,
            price: billDetailsEntity!.itemTotal!,
          ),
          defaultSpacerSmall,
          myOrderListEntity!.delivery_status != "Pending"
              ? BillNameWithPrice(
                  billType: AppLocalizations.of(context)!.delivery_charge,
                  price: billDetailsEntity!.deliveryCharge!,
                )
              : Text(billDetailsEntity!.deliveryMsg!),
          defaultSpacerSmall,
          BillNameWithPrice(
            billType: AppLocalizations.of(context)!.total,
            price: billDetailsEntity!.total,
          ),
          defaultSpacer,
          myOrderDetailsController.orderDetailsResponseModel!.data.orderStat ==
                  "1"
              ? DefaultButton(
                  isLoading: myOrderDetailsController.buttonLoading,
                  onPressed: myOrderDetailsController.orderCancel,
                  text: AppLocalizations.of(context)!.cancel_order,
                )
              : myOrderDetailsController
                          .orderDetailsResponseModel!.data.order[0].orderStat ==
                      "6"
                  ? DefaultButton(
                      isLoading: myOrderDetailsController.buttonLoading,
                      onPressed: myOrderDetailsController.orderAgain,
                      text: AppLocalizations.of(context)!.re_order,
                    )
                  : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
