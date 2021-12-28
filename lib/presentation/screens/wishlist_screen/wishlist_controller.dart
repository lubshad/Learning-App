import 'package:learning_app/data/models/view_wishlist_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/add_to_cart_params.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/add_to_cart.dart';
import 'package:learning_app/domain/usecases/get_wishlist_data.dart';
import 'package:learning_app/domain/usecases/remove_from_wishlist.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/components/components/wishlist_item.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class WishListController extends ChangeNotifier {
  final wishlistKey = GlobalKey<AnimatedListState>();
  List<ProductEntity> wishlistItems = [];
  GetWishListData getWishListData = Get.find();
  RemoveFromWishlist removeWishList = Get.find();
  AddtoCart addtoCart = Get.find();

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  removeItems(int index) async {
    appError = null;

    CartWishlistParams addToCartParams = CartWishlistParams(
        wishlistDetailId: wishlistItems[index].wishListDetailsId);
    final response = await removeWishList(addToCartParams);
    response.fold((l) => appError = l, (r) async {
      if (r["status"] == 1) {
        wishlistKey.currentState!.removeItem(
            index,
            (context, animation) =>
                WishListItem(index: index, animation: animation),
            duration: defaultAnimationDuration);
        await Future.delayed(defaultAnimationDuration);
        getData();
      }
      showMessage(r["message"]);
    });
  }

  addItemstoCart(String stockId, String vendorID, String qty) async {
    appError = null;
    final response = await addtoCart(CartWishlistParams(
        stockId: stockId, vendorID: vendorID, quantity: qty));
    response.fold((l) => appError = l, (r) => showMessage(r["message"]));
  }

  getData() async {
    appError = null;
    final response = await getWishListData(NoParams());
    response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
  }

  setData(ViewWishListResponseModel data) {
    wishlistItems = data.products!;
  }
}
