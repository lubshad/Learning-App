import 'package:learning_app/data/models/my_orders_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/domain/params/my_orders_params.dart';
import 'package:learning_app/domain/usecases/my_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyOrdersController extends ChangeNotifier {
  List<MyOrderListEntity> orderList = [];

  MyOrders myOrders = Get.find();

  int offset = 0;
  bool isLoadingMore = false;
  bool moreItemsAvailable = true;
  makeNoMoreItems() {
    moreItemsAvailable = false;
    notifyListeners();
  }

  makeMoreItems() {
    moreItemsAvailable = true;
    notifyListeners();
  }

  makeLoadingMore() {
    isLoadingMore = true;
    notifyListeners();
  }

  makeNotLoadingMore() {
    isLoadingMore = false;
    notifyListeners();
  }

  loadMore() async {
    if (moreItemsAvailable && !isLoadingMore) {
      makeLoadingMore();
      offset++;
      final response = await myOrders(MyOrdersParams(offset: offset));
      response.fold((l) => appError = l, (r) => addMoreItems(r));
    }
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

  retry() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  getData() async {
    offset = 0;
    appError = null;
    final response = await myOrders(MyOrdersParams(offset: offset));
    response.fold((l) => appError = l, (r) => setData(r));
    makeNotLoading();
  }

  setData(MyOrdersResponseModel orderData) {
    orderList = orderData.data.orders;
  }

  addMoreItems(MyOrdersResponseModel r) {
    if (r.data.orders.isNotEmpty) {
      orderList.addAll(r.data.orders);
    } else {
      makeNoMoreItems();
    }
    makeNotLoadingMore();
  }
}
