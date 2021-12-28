// To parse this JSON data, do
//
//     final orderDetailsResponseModel = orderDetailsResponseModelFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';

OrderDetailsResponseModel orderDetailsResponseModelFromJson(String str) =>
    OrderDetailsResponseModel.fromJson(json.decode(str));

String orderDetailsResponseModelToJson(OrderDetailsResponseModel data) =>
    json.encode(data.toJson());

class OrderDetailsResponseModel {
  OrderDetailsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.elapsedTime,
  });

  int status;
  String message;
  Data data;
  String elapsedTime;

  factory OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        elapsedTime: json["elapsed_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "elapsed_time": elapsedTime,
      };
}

class Data extends MyOrderListEntity {
  Data({
    required this.itemCount,
    required this.orderMasterId,
    required this.orderDate,
    required this.orderAmount,
    required this.itemTotal,
    required this.orderStatus,
    required this.paymentStatus,
    required this.orderDetails,
    required this.deliveryDate,
    required this.deliveryCharge,
    required this.paymentMode,
    required this.order,
    required this.orderStat,
    required this.deliveryAddress,
    required this.totalAmount,
    // required this.deliveryStatus,
    required this.expectedDate,
    this.deliveryChargeMsg,
  }) : super(
          order_id: orderMasterId,
          delivery_location: deliveryAddress,
          purchase_date: orderDate,
          item_count: itemCount,
          item_total: totalAmount,
          payment_mode: paymentMode,
          delivery_status: orderStatus,
          delivery_date: deliveryDate,
          expected_date: expectedDate,
        );

  String orderMasterId;
  String orderDate;
  String orderAmount;
  String itemTotal;
  String orderStatus;
  String paymentStatus;
  String orderDetails;
  dynamic deliveryDate;
  double deliveryCharge;
  String paymentMode;
  List<Order> order;
  String orderStat;
  String totalAmount;
  String deliveryAddress;
  String itemCount;
  // String deliveryStatus;
  String expectedDate;
  String? deliveryChargeMsg;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderMasterId: json["order_master_id"],
        orderDate: json["order_date"],
        orderAmount: json["order_amount"],
        itemTotal: json["item_total"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        orderDetails: json["order_details"],
        deliveryDate: json["delivery_date"],
        deliveryCharge: json["delivery_charge"].toDouble(),
        paymentMode: json["payment_mode"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
        orderStat: json["order_stat"],
        totalAmount: json["total_amount"].toString(),
        deliveryAddress: json["delivery_address"],
        // deliveryStatus: json["delivery_status"],
        expectedDate: json["expected_date"],
        itemCount: json["item_count"].toString(),
        deliveryChargeMsg: json["delivery_charge_msg"],
      );

  Map<String, dynamic> toJson() => {
        "order_master_id": orderMasterId,
        "order_date": orderDate,
        "order_amount": orderAmount,
        "item_total": itemTotal,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "order_details": orderDetails,
        "delivery_date": deliveryDate,
        "delivery_charge": deliveryCharge,
        "payment_mode": paymentMode,
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
        "order_stat": orderStat,
        "total_amount": totalAmount,
        "delivery_charge_msg": deliveryChargeMsg,
      };
}

class Order {
  Order({
    required this.orderId,
    required this.requestId,
    required this.orderDate,
    required this.deliveryAddress,
    required this.vendorName,
    required this.orderAmount,
    required this.orderStat,
    required this.paymentStatus,
    required this.orderDetails,
    required this.orderStatus,
  });

  String orderId;
  String requestId;
  String orderDate;
  String deliveryAddress;
  String vendorName;
  String orderAmount;
  String orderStat;
  String paymentStatus;
  List<OrderDetail> orderDetails;
  String orderStatus;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        requestId: json["request_id"],
        orderDate: json["order_date"],
        deliveryAddress: json["delivery_address"],
        vendorName: json["vendor_name"],
        orderAmount: json["order_amount"],
        orderStat: json["order_stat"],
        paymentStatus: json["payment_status"],
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
        orderStatus: json["order_status"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "request_id": requestId,
        "order_date": orderDate,
        "delivery_address": deliveryAddress,
        "vendor_name": vendorName,
        "order_amount": orderAmount,
        "order_stat": orderStat,
        "payment_status": paymentStatus,
        "order_details":
            List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "order_status": orderStatus,
      };
}

class OrderDetail extends ProductEntity {
  OrderDetail({
    required this.productVarientId,
    required this.productName,
    required this.vendorId,
    required this.varientName,
    required this.productQty,
    required this.productPrice,
    required this.productTotal,
    required this.productImage,
  }) : super(
            name: productName,
            imageUrl: productImage,
            qty: productQty,
            price: productPrice,
            total: productTotal,
            stockId: productVarientId);

  String productVarientId;
  String productName;
  @override
  // ignore: overridden_fields
  String vendorId;
  String varientName;
  String productQty;
  String productPrice;
  String productTotal;
  String productImage;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productVarientId: json["product_varient_id"],
        productName: json["product_name"],
        vendorId: json["vendor_id"],
        varientName: json["varient_name"],
        productQty: json["product_qty"],
        productPrice: json["product_price"],
        productTotal: json["product_total"],
        productImage: json["product_image"],
      );

  Map<String, dynamic> toJson() => {
        "product_varient_id": productVarientId,
        "product_name": productName,
        "vendor_id": vendorId,
        "varient_name": varientName,
        "product_qty": productQty,
        "product_price": productPrice,
        "product_total": productTotal,
        "product_image": productImage,
      };
}
