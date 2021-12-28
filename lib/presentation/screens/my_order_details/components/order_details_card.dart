import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: defaultPadding * .3, horizontal: defaultPadding * .5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * .5, vertical: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("# 3255"),
            defaultSpacerSmall,
            Text(
              "2 ${AppLocalizations.of(context)!.items} - 500.00 SR",
              style: Theme.of(context).textTheme.headline6,
            ),
            defaultSpacerSmall,
            const Text(
                "Madina Road, P.O. Box: 126111, Jeddah Al Khayyat Tower,Madina Road, Jeddah, "),
            defaultSpacerSmall,
            Text("${AppLocalizations.of(context)!.purchased_on} : 01-10-2021"),
            defaultSpacerSmall,
            Text(
                "${AppLocalizations.of(context)!.delivery_status} : Delivered"),
            defaultSpacerSmall,
            Text(
                "${AppLocalizations.of(context)!.payment_method} : Cash On Delivery"),
          ],
        ),
      ),
    );
  }
}
