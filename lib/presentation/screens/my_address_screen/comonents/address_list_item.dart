import 'package:learning_app/domain/entities/address_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class AddressListItem extends StatelessWidget {
  const AddressListItem({
    Key? key,
    required this.addressEntity,
  }) : super(key: key);

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
        title: Text(addressEntity.street),
        minVerticalPadding: defaultPadding,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(addressEntity.address),
            defaultSpacerSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.country_code +
                      " " +
                      addressEntity.phoneNumber,
                )
                // if (addressEntity.addressType ==
                //     AddressType.pendingVerification)
                //   Text(
                //     AppLocalizations.of(context)!.pending_verification,
                //     style: const TextStyle(color: errorColor),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
