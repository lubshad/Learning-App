import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/add_address_screen/add_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/google_map_with_change_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/add_address_form.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.find();
    addAddressController.setData();
    addAddressController.changeLocation(context);

    return AnimatedBuilder(
      animation: addAddressController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: bgLightBlue,
            title: Text(AppLocalizations.of(context)!.add_address),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                GoogleMapWithChangeLocation(
                    location: addAddressController.geoLocation,
                    changeLocation: () =>
                        addAddressController.changeLocation(context)),
                defaultSpacer,
                AddAddressForm(addAddressController: addAddressController),
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
              text: AppLocalizations.of(context)!.add_address,
              onPressed: addAddressController.addUserAddress,
              isLoading: addAddressController.buttonLoading,
            ),
          ),
        );
      },
    );
  }
}
