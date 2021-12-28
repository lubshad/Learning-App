import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/product_details_screen/components/product_details_section.dart';
import 'package:learning_app/presentation/screens/product_details_screen/product_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:learning_app/presentation/widgets/quantity_change_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/product_details_appbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController = Get.find();
    productDetailsController.getData();
    return AnimatedBuilder(
      animation: productDetailsController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: productDetailsController.appError,
          loading: productDetailsController.isLoading,
          retry: productDetailsController.getData,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                ProductDetailsAppBar(
                    productDetailsController: productDetailsController),
                ProductDetailsSections(
                    productDetailsController: productDetailsController),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding * .5),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: QuantityChangeButtons(
                        quantityController:
                            productDetailsController.quantityController,
                        decreaseQty: productDetailsController.decreaseQuantity,
                        increaseQty: productDetailsController.increaseQuantity,
                      )),
                  defaultSpacerHorizontal,
                  Expanded(
                    flex: 3,
                    child: productDetailsController.isCartProduct
                        ? DefaultButton(
                            text: AppLocalizations.of(context)!.go_to_cart,
                            onPressed: () {
                              Get.until((route) =>
                                  Get.currentRoute == RouteList.initial);
                              Get.find<NavigationScreenController>()
                                  .changeScreen(Screens.cart.index);
                            },
                            isLoading: productDetailsController.buttonLoading,
                          )
                        : DefaultButton(
                            text: AppLocalizations.of(context)!.add_to_cart,
                            onPressed:
                                productDetailsController.addProductToCart,
                            isLoading: productDetailsController.buttonLoading,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
