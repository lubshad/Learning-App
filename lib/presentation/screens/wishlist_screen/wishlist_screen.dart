import 'package:learning_app/presentation/screens/wishlist_screen/wishlist_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'components/wish_list_items.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishListController wishListController = Get.find();
    wishListController.getData();
    return AnimatedBuilder(
      animation: wishListController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: bgLightBlue,
            title: Text(
              AppLocalizations.of(context)!.wishlist,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: NetworkResource(
            loading: wishListController.isLoading,
            retry: wishListController.getData,
            appError: wishListController.appError,
            child:
                WishListItems(wishlistItems: wishListController.wishlistItems),
          ),
        );
      },
    );
  }
}
