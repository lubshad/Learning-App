import 'package:learning_app/data/models/checkout_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/domain/entities/payment_method_entity.dart';
import 'package:learning_app/domain/entities/platform.dart';
import 'package:learning_app/domain/params/checkout_params.dart';
import 'package:learning_app/domain/params/place_order_params.dart';
import 'package:learning_app/domain/usecases/checkout_cart.dart';
import 'package:learning_app/domain/usecases/place_order.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class CheckoutController extends ChangeNotifier {
  BillDetailsEntity? billDetailsEntity;
  PaymentMethodEntity? selectedPaymentMethod;
  List<PaymentMethodEntity> paymentMethods = [];

  CheckoutCart checkoutCart = Get.find();
  PlaceOrder placeOrder = Get.find();
  MyAddressController myAddressController = Get.find();

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

  getData() async {
    appError = null;
    final response = await checkoutCart(CheckOutParams(cartId: Get.arguments));
    response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
  }

  void changePaymentMethod(PaymentMethodEntity? value) {
    selectedPaymentMethod = value;
    notifyListeners();
  }

  bool validate(BuildContext context) {
    bool valid = false;
    if (selectedPaymentMethod == null) {
      showMessage(AppLocalizations.of(context)!.choose_payment_method);
    } else {
      valid = true;
    }
    return valid;
  }

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  setData(CheckoutResponseModel checkoutData) {
    paymentMethods = checkoutData.data.paymentMethods;
    billDetailsEntity = BillDetailsEntity(
        total: checkoutData.data.billDetails.totalAmount.toString(),
        itemTotal: checkoutData.data.billDetails.itemTotal.toString(),
        discountAmount: checkoutData.data.billDetails.discountAmount,
        deliveryCharge: checkoutData.data.billDetails.deliveryCharge,
        deliveryMsg: checkoutData.data.billDetails.deliveryChargeMsg);
  }

  orderPlace(BuildContext context) async {
    if (validate(context)) {
      appError = null;
      makeButtonLoading();
      final response = await placeOrder(PlaceOrderParams(
        addressId: myAddressController.addressList[0].addressId,
        cartId: Get.arguments,
        paymentOption: selectedPaymentMethod!.code,
        platform: DevicePlatform.android,
      ));
      response.fold((l) => appError = l, (r) {
        if (r["status"] == 1) {
          if (selectedPaymentMethod!.code == "cod") {
            Get.offNamed(RouteList.orderSuccess);
          } else {}
        }
        showMessage(r["message"]);
      });
      makeButtonNotLoading();
    }
  }
}
