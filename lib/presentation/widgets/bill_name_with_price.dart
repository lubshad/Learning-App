import 'package:learning_app/l10n/localization.dart';
import 'package:flutter/material.dart';

class BillNameWithPrice extends StatelessWidget {
  const BillNameWithPrice({
    Key? key,
    required this.billType,
    required this.price,
  }) : super(key: key);

  final String billType;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(billType),
        Text(
          price + " " + AppLocalizations.of(context)!.currency,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
