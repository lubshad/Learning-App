import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';

import 'components/product_details_appbar.dart';
import 'components/product_details_section.dart';
import 'course_details_controller.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({
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
                if (productDetailsController.productDetailsResponseModel !=
                    null)
                  ProductDetailsSections(
                    productDetailsController: productDetailsController,),
              ],
            ),
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: defaultPadding, vertical: defaultPadding * .5),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           flex: 3,
            //           child: QuantityChangeButtons(
            //             quantityController:
            //                 productDetailsController.quantityController,
            //             decreaseQty: productDetailsController.decreaseQuantity,
            //             increaseQty: productDetailsController.increaseQuantity,
            //           )),
            //       defaultSpacerHorizontal,
            //       Expanded(
            //         flex: 3,
            //         child: productDetailsController.isCartProduct
            //             ? DefaultButton(
            //                 text: AppLocalizations.of(context)!.go_to_cart,
            //                 onPressed: () {
            //                   Get.until((route) =>
            //                       Get.currentRoute == RouteList.initial);
            //                   Get.find<NavigationScreenController>()
            //                       .changeScreen(Screens.cart.index);
            //                 },
            //                 isLoading: productDetailsController.buttonLoading,
            //               )
            //             : DefaultButton(
            //                 text: AppLocalizations.of(context)!.add_to_cart,
            //                 onPressed:
            //                     productDetailsController.addProductToCart,
            //                 isLoading: productDetailsController.buttonLoading,
            //               ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
