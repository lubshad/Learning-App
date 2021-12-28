import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/edit_address_screen/edit_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/google_map_with_change_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/edit_address_from.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditAddressController editAddressController = Get.find();
    editAddressController.setData();

    return AnimatedBuilder(
      animation: editAddressController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: bgLightBlue,
            title: Text(AppLocalizations.of(context)!.edit_address),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                GoogleMapWithChangeLocation(
                    location: editAddressController.geoLocation,
                    changeLocation: () =>
                        editAddressController.changeLocation(context)),
                defaultSpacer,
                EditAddressForm(editAddressController: editAddressController),
              ]),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(defaultPadding * .5),
            decoration: const BoxDecoration(
              color: whiteColor,
              boxShadow: defaultShadow,
            ),
            child: DefaultButton(
              text: AppLocalizations.of(context)!.edit_address,
              onPressed: editAddressController.editDefaultAddress,
              isLoading: editAddressController.buttonLoading,
            ),
          ),
        );
      },
    );
  }
}
