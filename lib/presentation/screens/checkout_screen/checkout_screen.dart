import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/checkout_screen/checkout_controller.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'components/delivery_address.dart';
import 'components/payment_method.dart';
import 'components/place_order_bill_details.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find();
    checkoutController.getData();
    MyAddressController myAddressController = Get.find();
    return AnimatedBuilder(
      animation: checkoutController,
      builder: (context, child) {
        return NetworkResource(
          appError: checkoutController.appError,
          loading: checkoutController.isLoading,
          retry: checkoutController.getData,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.checkout,
                style: Theme.of(context).textTheme.headline6,
              ),
              backgroundColor: bgLightBlue,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeliveryAddress(
                    addressEntity: myAddressController.addressList[0],
                  ),
                  PaymentMethod(
                    checkoutController: checkoutController,
                  ),
                  if (checkoutController.billDetailsEntity != null)
                    PlaceOrderBillDetails(
                      billDetailsEntity: checkoutController.billDetailsEntity!,
                    ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: DefaultButton(
                text: AppLocalizations.of(context)!.place_order,
                isLoading: checkoutController.buttonLoading,
                onPressed: () => checkoutController.orderPlace(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
