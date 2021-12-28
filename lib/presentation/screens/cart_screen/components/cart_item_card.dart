import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/update_cart_bottomsheet.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key, required this.index, required this.animation})
      : super(key: key);

  final int index;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    CartScreenController cartScreenController = Get.find();
    return FadeTransition(
      opacity: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: defaultPadding * .25, horizontal: defaultPadding * .5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding * .5),
          child: ListTile(
            onTap: () => Get.toNamed(RouteList.productDetailsScreen,
                arguments: cartScreenController.cartProductsList[index]),
            leading: CachedNetworkImage(
              imageUrl: cartScreenController.cartProductsList[index].imageUrl!,
              width: defaultPadding * 3,
              height: defaultPadding * 3,
              errorWidget: (context, url, error) => Image.asset(
                "assets/no_image.png",
              ),
            ),
            title: Text(
              cartScreenController.cartProductsList[index].name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle:
                cartScreenController.cartProductsList[index].stockAvailable ==
                        ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 0,
                                          vertical: defaultPadding * .5))),
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(defaultPadding * 1.5),
                                      topRight:
                                          Radius.circular(defaultPadding * 1.5),
                                    )),
                                    backgroundColor: whiteColor,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        UpdateCartBottomSheet(
                                          position: index,
                                        ));
                              },
                              icon: Text(
                                  "${cartScreenController.cartProductsList[index].qty} X ${cartScreenController.cartProductsList[index].price}"),
                              label: const Icon(Icons.arrow_drop_down)),
                          Text(
                            cartScreenController.cartProductsList[index].total!
                                    .toString() +
                                " " +
                                AppLocalizations.of(context)!.currency,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      )
                    : Text(
                        cartScreenController
                            .cartProductsList[index].stockAvailable!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: errorColor),
                      ),
            trailing: IconButton(
                alignment: Alignment.topRight,
                onPressed: () => cartScreenController.removeItem(index),
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: primaryColor,
                )),
          ),
        ),
      ),
    );
  }
}
