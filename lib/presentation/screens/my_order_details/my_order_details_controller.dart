import 'package:learning_app/data/models/order_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/bill_details_entity.dart';
import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/order_cancel_re_order_params.dart';
import 'package:learning_app/domain/params/order_details_params.dart';
import 'package:learning_app/domain/usecases/cancel_order.dart';
import 'package:learning_app/domain/usecases/order_details.dart';
import 'package:learning_app/domain/usecases/re_order.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/my_orders/my_orders_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class MyOrderDetailsController extends ChangeNotifier {
  List<ProductEntity> products = [];
  BillDetailsEntity? billDetailsEntity;
  OrderDetailsResponseModel? orderDetailsResponseModel;

  OrderDetails orderDetails = Get.find();
  String orderId = Get.arguments;
  MyOrderListEntity? myOrderListEntity;

  CancelOrder cancelOrder = Get.find();
  ReOrder reOrder = Get.find();

  MyOrdersController myOrdersController = Get.find();

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

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  orderAgain() async {
    makeButtonLoading();
    appError = null;
    final response = await reOrder(OrderCancelReOrderParams(
        orderId: orderDetailsResponseModel!.data.order[0].orderId));
    response.fold((l) => appError = l, (r) {
      if (r["status"] == 1) {
        myOrdersController.getData();
        Get.until((route) => route.settings.name == RouteList.myOrders);
      }
      showMessage(r["message"]);
    });
    makeButtonNotLoading();
  }

  orderCancel() async {
    makeButtonLoading();
    appError = null;
    final response = await cancelOrder(OrderCancelReOrderParams(
        orderId: orderDetailsResponseModel!.data.orderMasterId));
    response.fold((l) => appError = l, (r) {
      if (r["status"] == 1) {
        myOrdersController.getData();
        Get.until((route) => route.settings.name == RouteList.myOrders);
      }
      showMessage(r["message"]);
    });
    makeButtonNotLoading();
  }

  getData() async {
    appError = null;
    final response = await orderDetails(OrderDetailsParams(orderId: orderId));
    response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
  }

  setData(OrderDetailsResponseModel orderData) {
    orderDetailsResponseModel = orderData;
    products = orderData.data.order[0].orderDetails;
    myOrderListEntity = orderData.data;
    billDetailsEntity = BillDetailsEntity(
        total: orderData.data.totalAmount.toString(),
        itemTotal: orderData.data.order[0].orderAmount.toString(),
        deliveryCharge: orderData.data.deliveryCharge.toString(),
        deliveryMsg: orderData.data.deliveryChargeMsg);
  }
}
