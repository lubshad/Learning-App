// To parse required this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:learning_app/domain/entities/user_entity.dart';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  VerifyOtpResponse({
    required this.status,
    this.data,
    required this.message,
  });

  int status;
  Data? data;
  String message;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
        "message": message,
      };
}

// ignore: must_be_immutable
class Data extends UserEntity {
  Data(
      {required this.shopImage,
      required this.customerId,
      required this.customerName,
      required this.customerPhone,
      required this.sessionValue,
      required this.countryCode,
      required this.rewardPoints,
      required this.registrationStatus})
      : super(
            userId: customerId,
            phone: customerPhone,
            sessionId: sessionValue,
            imageUrl: shopImage,
            name: customerPhone);

  String shopImage;
  String customerId;
  String customerName;
  String customerPhone;
  String sessionValue;
  String countryCode;
  String rewardPoints;
  int registrationStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        registrationStatus: json["registration_status"],
        shopImage: json["shop_image"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        sessionValue: json["session_value"],
        countryCode: json["country_code"],
        rewardPoints: json["reward_points"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "registration_status": registrationStatus,
        "shop_image": shopImage,
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "session_value": sessionValue,
        "country_code": countryCode,
        "reward_points": rewardPoints,
      };
}
