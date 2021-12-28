import 'package:learning_app/domain/entities/region_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import '../register_screen_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.registerScreenController,
  }) : super(key: key);

  final RegisterScreenController registerScreenController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerScreenController.formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_your_shop_name
                  : value.length < 3 || value.isNumericOnly
                      ? AppLocalizations.of(context)!
                          .please_enter_valid_shop_name
                      : null;
            },
            controller: registerScreenController.nameController,
            decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.shop_name)),
          ),
          defaultSpacerSmall,
          TextFormField(
            keyboardType: TextInputType.phone,
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
            controller: registerScreenController.phoneController,
            decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.phone_number),
                prefixText: AppLocalizations.of(context)!.country_code + " "),
          ),
          defaultSpacerSmall,
          DropdownButtonFormField<RegionEntity>(
              decoration: const InputDecoration(
                  hintText: "Please select your region", labelText: "Region"),
              validator: registerScreenController.validateRegionSelection,
              onChanged: registerScreenController.changeSelectedRegion,
              value: registerScreenController.selectedRegion,
              items: registerScreenController.regionDropdownItems)
        ],
      ),
    );
  }
}
