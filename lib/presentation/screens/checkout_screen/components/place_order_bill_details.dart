import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bill_name_with_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceOrderBillDetails extends StatelessWidget {
  const PlaceOrderBillDetails({
    Key? key,
    required this.billDetailsEntity,
  }) : super(key: key);

  final BillDetailsEntity billDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.bill_details,
              style: Theme.of(context).textTheme.headline6,
            ),
            defaultSpacer,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * .6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BillNameWithPrice(
                  //   billType: AppLocalizations.of(context)!.item_total,
                  //   price: billDetailsEntity.itemTotal.toString(),
                  // ),
                  // defaultSpacerSmall,
                  // BillNameWithPrice(
                  //   billType: AppLocalizations.of(context)!.discount,
                  //   price: billDetailsEntity.discountAmount.toString(),
                  // ),
                  // defaultSpacerSmall,
                  // BillNameWithPrice(
                  //   billType: AppLocalizations.of(context)!.delivery_charge,
                  //   price: billDetailsEntity.deliveryCharge.toString(),
                  // ),
                  billDetailsEntity.deliveryMsg != ""
                      ? Column(
                          children: [
                            Text(billDetailsEntity.deliveryMsg!),
                            defaultSpacer,
                          ],
                        )
                      : const SizedBox.shrink(),
                  BillNameWithPrice(
                    billType: AppLocalizations.of(context)!.total,
                    price: billDetailsEntity.total,
                  )
                ],
              ),
            ),
            defaultSpacer,
          ],
        ),
      ),
    );
  }
}
