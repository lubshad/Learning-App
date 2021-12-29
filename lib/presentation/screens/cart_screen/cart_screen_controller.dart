import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/data/models/view_cart_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/domain/usecases/get_cart_data.dart';
import 'package:learning_app/domain/usecases/remove_cart.dart';
import 'package:learning_app/domain/usecases/update_cart.dart';
import 'package:learning_app/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class CartScreenController extends ChangeNotifier {
  List<Course> courseList = [];
  final cartListKey = GlobalKey<AnimatedListState>(debugLabel: "cart_list_key");
  BillDetailsEntity? billDetailsEntity;

  ViewCartResponseModel? viewCartResponseModel;

  GetCartData getCartData = Get.find();
  UpdateCart updateCart = Get.find();
  RemoveCart removeCart = Get.find();

  MyAddressController myAddressController = Get.find();

  // TextEditingController quantityController = TextEditingController(text: "1");

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
    // final response = await getCartData(NoParams());
    // response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
    // myAddressController.getData();
  }

  setData(ViewCartResponseModel cartData) {
    viewCartResponseModel = cartData;
    // courseList = cartData.products!;
    // billDetailsEntity = BillDetailsEntity(
    //     total: cartData.totalAmount!.toString(),
    //     itemTotal: cartData.itemTotal,
    //     deliveryCharge: cartData.deliveryTotal.toString());
  }

  void decreaseQuantity(Course course) {
    final index = courseList.indexOf(course);
    final newQty = courseList[index].cartCount - 1;
    if (newQty > 0) {
      courseList[index].cartCount = newQty;
      updateBillDetails();
    } else {
      removeItem(index);
    }
  }

  void increaseQuantity(Course course) {
    final index = courseList.indexOf(course);
    final newQty = courseList[index].cartCount + 1;
    courseList[index].cartCount = newQty;
    updateBillDetails();
  }

  void updateCartProducts(int position, String qty) async {
    // appError = null;
    // final response = await updateCart(UpdateCartParams(
    //     productVariantId: courseList[position].stockId!,
    //     quantity: qty,
    //     vendorId: courseList[position].vendorId!,
    //     cartDetailId: courseList[position].cartDetailsId!));
    // response.fold((l) => appError = l, (r) {
    //   if (r["status"] == 1) {
    //     getData();
    //   }
    //   Get.until((route) => route.settings.name == RouteList.initial);
    //   showMessage(r["message"]);
    // });
  }

  // bool get checkStockAvailbilty =>
  //     courseList.where((element) => element.stockAvailable != "").isEmpty;

  removeItem(int index) async {
    courseList.removeAt(index);
    showMessage("Item removed from cart");
    updateBillDetails();
  }

  void addToCart(Course course) {
    if (courseList.where((element) => element.id == course.id).isNotEmpty) {
      showMessage("Item already in cart");
    } else {
      courseList.add(course);
      showMessage("Item added to cart successfully");
      NavigationScreenController navigationScreenController = Get.find();
      navigationScreenController.changeScreen(Screens.cart.index);
      updateBillDetails();
    }
  }

  void updateBillDetails() {
    final itemTotal = courseList
        .fold<double>(
            0,
            (previousValue, element) =>
                previousValue +
                (double.parse(element.price) * element.cartCount))
        .toDouble();
    billDetailsEntity = BillDetailsEntity(total: itemTotal.toString());
    notifyListeners();
  }
}
