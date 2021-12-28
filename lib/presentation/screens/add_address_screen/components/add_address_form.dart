import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/add_address_screen/add_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({
    Key? key,
    required this.addAddressController,
  }) : super(key: key);

  final AddAddressController addAddressController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addAddressController.formKey,
      child: Column(
        children: [
          TextFormField(
            maxLines: 3,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_your_address
                  : value.length < 10
                      ? AppLocalizations.of(context)!
                          .please_enter_more_specific_address
                      : null;
            },
            controller: addAddressController.addressController,
            decoration: InputDecoration(
              label: Text(AppLocalizations.of(context)!.address),
            ),
          ),
          defaultSpacerSmall,
          TextFormField(
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_your_street_name
                  : value.length < 3
                      ? AppLocalizations.of(context)!.enter_a_valid_street_name
                      : null;
            },
            controller: addAddressController.streetController,
            decoration: InputDecoration(
              label: Text(AppLocalizations.of(context)!.street),
            ),
          ),
          defaultSpacerSmall,
          TextFormField(
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.empty_phone_number
                  : value.length != 9
                      ? AppLocalizations.of(context)!.invalid_phone_number
                      : null;
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(9),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            controller: addAddressController.phoneController,
            decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.phone_number),
                prefixText: AppLocalizations.of(context)!.country_code + " "),
          ),
        ],
      ),
    );
  }
}
