// To parse this JSON data, do
//
//     final checkoutResponseModel = checkoutResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:learning_app/domain/entities/payment_method_entity.dart';

CheckoutResponseModel checkoutResponseModelFromJson(String str) =>
    CheckoutResponseModel.fromJson(json.decode(str));

String checkoutResponseModelToJson(CheckoutResponseModel data) =>
    json.encode(data.toJson());

class CheckoutResponseModel {
  CheckoutResponseModel({
    required this.status,
    required this.error,
    required this.data,
    required this.elapsedTime,
  });

  int status;
  Error error;
  Data data;
  String elapsedTime;

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckoutResponseModel(
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
    required this.billDetails,
    required this.paymentMethods,
  });

  BillDetails billDetails;
  List<PaymentMethod> paymentMethods;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        billDetails: BillDetails.fromJson(json["bill_details"]),
        paymentMethods: List<PaymentMethod>.from(
            json["payment_methods"].map((x) => PaymentMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bill_details": billDetails.toJson(),
        "payment_methods":
            List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
      };
}

class BillDetails {
  BillDetails({
    required this.billId,
    required this.itemTotal,
    required this.discountAmount,
    required this.deliveryCharge,
    required this.totalAmount,
    required this.deliveryChargeMsg,
  });

  String billId;
  double itemTotal;
  String discountAmount;
  String deliveryCharge;
  double totalAmount;
  String deliveryChargeMsg;

  factory BillDetails.fromJson(Map<String, dynamic> json) => BillDetails(
        billId: json["bill_id"],
        itemTotal: json["item_total"].toDouble(),
        discountAmount: json["discount_amount"],
        deliveryCharge: json["delivery_charge"].toString(),
        totalAmount: json["total_amount"].toDouble(),
        deliveryChargeMsg: json["delivery_charge_msg"],
      );

  Map<String, dynamic> toJson() => {
        "bill_id": billId,
        "item_total": itemTotal,
        "discount_amount": discountAmount,
        "delivery_charge": deliveryCharge,
        "total_amount": totalAmount,
        "delivery_charge_msg": deliveryChargeMsg,
      };
}

// ignore: must_be_immutable
class PaymentMethod extends PaymentMethodEntity {
  PaymentMethod({
    required this.typeName,
    required this.code,
    required this.type,
    required this.link,
    required this.success,
    required this.image,
    required this.orderType,
  }) : super(text: typeName, code: code);

  String typeName;
  @override
  // ignore: overridden_fields
  String code;
  String type;
  String link;
  String success;
  String image;
  String orderType;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        typeName: json["type_name"],
        code: json["code"],
        type: json["type"],
        link: json["link"],
        success: json["success"],
        image: json["image"],
        orderType: json["order_type"],
      );

  Map<String, dynamic> toJson() => {
        "type_name": typeName,
        "code": code,
        "type": type,
        "link": link,
        "success": success,
        "image": image,
        "order_type": orderType,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
