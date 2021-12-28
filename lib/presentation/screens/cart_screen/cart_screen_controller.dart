import 'package:learning_app/data/models/view_cart_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/params/remove_cart_params.dart';
import 'package:learning_app/domain/params/update_cart_params.dart';
import 'package:learning_app/domain/usecases/get_cart_data.dart';
import 'package:learning_app/domain/usecases/remove_cart.dart';
import 'package:learning_app/domain/usecases/update_cart.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class CartScreenController extends ChangeNotifier {
  List<ProductEntity> cartProductsList = [];
  final cartListKey = GlobalKey<AnimatedListState>(debugLabel: "cart_list_key");
  BillDetailsEntity? billDetailsEntity;

  ViewCartResponseModel? viewCartResponseModel;

  GetCartData getCartData = Get.find();
  UpdateCart updateCart = Get.find();
  RemoveCart removeCart = Get.find();

  MyAddressController myAddressController = Get.find();

  TextEditingController quantityController = TextEditingController(text: "1");

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

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

  getData() async {
    appError = null;
    final response = await getCartData(NoParams());
    response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
    myAddressController.getData();
  }

  setData(ViewCartResponseModel cartData) {
    viewCartResponseModel = cartData;
    cartProductsList = cartData.products!;
    billDetailsEntity = BillDetailsEntity(
        total: cartData.totalAmount!.toString(),
        itemTotal: cartData.itemTotal,
        deliveryCharge: cartData.deliveryTotal.toString());
  }

  // void decreaseQuantity() {
  //   final newQty = int.parse(quantityController.text) - 1;
  //   if (newQty > 0) {
  //     quantityController.text = newQty.toString();
  //   }
  // }

  // void increaseQuantity() {
  //   final newQty = int.parse(quantityController.text) + 1;
  //   quantityController.text = newQty.toString();
  // }

  void updateCartProducts(int position, String qty) async {
    appError = null;
    final response = await updateCart(UpdateCartParams(
        productVariantId: cartProductsList[position].stockId!,
        quantity: qty,
        vendorId: cartProductsList[position].vendorId!,
        cartDetailId: cartProductsList[position].cartDetailsId!));
    response.fold((l) => appError = l, (r) {
      if (r["status"] == 1) {
        getData();
      }
      Get.until((route) => route.settings.name == RouteList.initial);
      showMessage(r["message"]);
    });
  }

  bool get checkStockAvailbilty =>
      cartProductsList.where((element) => element.stockAvailable != "").isEmpty;

  removeItem(int index) async {
    appError = null;
    final response = await removeCart(
        RemoveCartParams(cartDetailId: cartProductsList[index].cartDetailsId!));
    response.fold((l) => appError = l, (r) async {
      if (r["status"] == 1) {
        cartListKey.currentState!.removeItem(
            index,
            (context, animation) =>
                CartItemCard(index: index, animation: animation),
            duration: defaultAnimationDuration);
        await Future.delayed(defaultAnimationDuration);
        getData();
      }
      showMessage(r["message"]);
    });
  }
}
