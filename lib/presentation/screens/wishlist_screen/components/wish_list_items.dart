import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/components/components/wishlist_item.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class WishListItems extends StatelessWidget {
  const WishListItems({
    Key? key,
    required this.wishlistItems,
  }) : super(key: key);

  final List<ProductEntity> wishlistItems;

  @override
  Widget build(BuildContext context) {
    WishListController wishListController = Get.find();
    return SizedBox(
        height: double.infinity,
        child: wishlistItems.isEmpty
            ? Center(child: Text(AppLocalizations.of(context)!.wishlist_empty))
            : AnimatedList(
                key: wishListController.wishlistKey,
                itemBuilder: (context, index, animation) {
                  return WishListItem(index: index, animation: animation);
                },
                initialItemCount: wishlistItems.length,
              ));
  }
}
