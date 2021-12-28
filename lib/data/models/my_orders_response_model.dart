// To parse this JSON data, do
//
//     final myOrdersResponseModel = myOrdersResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:learning_app/domain/entities/my_order_list_entity.dart';

MyOrdersResponseModel myOrdersResponseModelFromJson(String str) =>
    MyOrdersResponseModel.fromJson(json.decode(str));

String myOrdersResponseModelToJson(MyOrdersResponseModel data) =>
    json.encode(data.toJson());

class MyOrdersResponseModel {
  MyOrdersResponseModel({
    required this.status,
    required this.error,
    required this.data,
    required this.elapsedTime,
  });

  int status;
  Error error;
  Data data;
  String elapsedTime;

  factory MyOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      MyOrdersResponseModel(
        status: json["status"],
        error: Error.fromJson(json["error"]),
        data: Data.fromJson(json["data"]),
        elapsedTime: json["elapsed_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error.toJson(),
        "data": data.toJson(),
        "elapsed_time": elapsedTime,
      };
}

class Data {
  Data({
    required this.orders,
  });

  List<Order> orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class Order extends MyOrderListEntity {
  Order({
    required this.orderId,
    required this.deliveryLocation,
    required this.purchaseDate,
    required this.itemCount,
    required this.itemTotal,
    required this.deliveryStatus,
    required this.deliveryDate,
    required this.paymentMode,
    required this.expectedDate,
    required this.orderTotal,
  }) : super(
            order_id: orderId,
            delivery_location: deliveryLocation,
            purchase_date: purchaseDate,
            item_count: itemCount,
            item_total: orderTotal,
            payment_mode: paymentMode,
            delivery_status: deliveryStatus,
            delivery_date: deliveryDate,
            expected_date: expectedDate);

  String orderId;
  String deliveryLocation;
  String purchaseDate;
  String itemCount;
  String itemTotal;
  String deliveryStatus;
  String? deliveryDate;
  String paymentMode;
  String? expectedDate;
  String orderTotal;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        deliveryLocation: json["delivery_location"],
        purchaseDate: json["purchase_date"],
        itemCount: json["item_count"].toString(),
        itemTotal: json["item_total"],
        deliveryStatus: json["delivery_status"],
        deliveryDate: json["delivery_date"],
        paymentMode: json["payment_mode"],
        expectedDate: json["expected_date"],
        orderTotal: json["order_total"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "delivery_location": deliveryLocation,
        "purchase_date": purchaseDate,
        "item_count": itemCount,
        "item_total": itemTotal,
        "delivery_status": deliveryStatus,
        "delivery_date": deliveryDate,
        "payment_mode": paymentMode,
        "expected_date": expectedDate,
        "order_total": orderTotal,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
