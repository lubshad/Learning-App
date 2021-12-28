import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/wishlist_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    Key? key,
    required this.index,
    required this.animation,
  }) : super(key: key);

  final int index;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    WishListController wishListController = Get.find();
    ProductEntity wishlistItemEntity = wishListController.wishlistItems[index];
    return FadeTransition(
      opacity: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: defaultPadding * .25, horizontal: defaultPadding * .5),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding * .5),
          child: InkWell(
            onTap: () => Get.toNamed(RouteList.productDetailsScreen,
                arguments: wishListController.wishlistItems[index]),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl: wishlistItemEntity.imageUrl!,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
                defaultSpacerHorizontalSmall,
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishlistItemEntity.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      defaultSpacerSmall,
                      Text(
                        wishlistItemEntity.price!.toString() +
                            " " +
                            AppLocalizations.of(context)!.currency,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () =>
                              wishListController.removeItems(index),
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: blackColor,
                          )),
                      wishlistItemEntity.stockAvailable != ""
                          ? TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: whiteColor,
                                  primary: errorColor),
                              child: Text(wishlistItemEntity.stockAvailable!),
                              onPressed: () => {},
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  primary: whiteColor),
                              child: Text(
                                  AppLocalizations.of(context)!.add_to_cart),
                              onPressed: () =>
                                  wishListController.addItemstoCart(
                                      wishlistItemEntity.stockId!,
                                      wishlistItemEntity.vendorId!,
                                      "1"),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
