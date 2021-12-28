import 'package:get/get.dart';
import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({
    Key? key,
    required this.myOrderListEntity,
  }) : super(key: key);

  final MyOrderListEntity myOrderListEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteList.myOrderDetails,
            arguments: myOrderListEntity.order_id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: defaultPadding * .3, horizontal: defaultPadding * .5),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * .5, vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("# ${myOrderListEntity.order_id}"),
              defaultSpacerSmall,
              Text(
                "${myOrderListEntity.item_count} ${AppLocalizations.of(context)!.items} - ${myOrderListEntity.item_total} ${AppLocalizations.of(context)!.currency} ",
                style: Theme.of(context).textTheme.headline6BoldPrimary(),
              ),
              defaultSpacerSmall,
              Text(myOrderListEntity.delivery_location),
              defaultSpacerSmall,
              Text(
                  "${AppLocalizations.of(context)!.purchased_on} : ${myOrderListEntity.purchase_date}"),
              defaultSpacerSmall,
              Text(
                  "${AppLocalizations.of(context)!.delivery_status} : ${myOrderListEntity.delivery_status}"),
              defaultSpacerSmall,
              myOrderListEntity.delivery_status == "Delivered"
                  ? Column(
                      children: [
                        Text(
                            "${AppLocalizations.of(context)!.deliverd_on} : ${myOrderListEntity.delivery_date}"),
                        defaultSpacerSmall,
                      ],
                    )
                  : const SizedBox.shrink(),
              myOrderListEntity.delivery_status == "Processed" ||
                      myOrderListEntity.delivery_status == "Dispatched" ||
                      myOrderListEntity.delivery_status == "Accepted"
                  ? Column(
                      children: [
                        Text(
                            "${AppLocalizations.of(context)!.expected_on} : ${myOrderListEntity.expected_date}"),
                        defaultSpacerSmall,
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(
                  "${AppLocalizations.of(context)!.payment_method} : ${myOrderListEntity.payment_mode}"),
            ],
          ),
        ),
      ),
    );
  }
}
