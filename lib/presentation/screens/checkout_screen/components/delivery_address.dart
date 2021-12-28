import 'package:learning_app/domain/entities/address_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    Key? key,
    required this.addressEntity,
  }) : super(key: key);

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * .5),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.delivery_address,
              style: Theme.of(context).textTheme.headline6,
            ),
            defaultSpacer,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * .6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressEntity.street,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  defaultSpacerSmall,
                  Text(
                    addressEntity.address,
                  ),
                  defaultSpacerSmall,
                  Text(
                    AppLocalizations.of(context)!.country_code +
                        " " +
                        addressEntity.phoneNumber,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
