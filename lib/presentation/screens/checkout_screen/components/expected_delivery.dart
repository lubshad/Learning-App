import 'package:learning_app/domain/entities/exp_delivery_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpectedDelivery extends StatelessWidget {
  const ExpectedDelivery({Key? key, required this.expectedDeliveryEntity})
      : super(key: key);

  final ExpectedDeliveryEntity expectedDeliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding * .5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.exp_delivery,
                style: Theme.of(context).textTheme.headline6,
              ),
              defaultSpacer,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * .6),
                child: Text(
                  expectedDeliveryEntity.expDeliveryText,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              defaultSpacer,
            ],
          ),
        ),
      ),
    );
  }
}
