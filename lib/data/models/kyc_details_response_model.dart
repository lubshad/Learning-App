// To parse this JSON data, do
//
//     final kycDetailsResponseModel = kycDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

KycDetailsResponseModel kycDetailsResponseModelFromJson(String str) =>
    KycDetailsResponseModel.fromJson(json.decode(str));

class KycDetailsResponseModel {
  KycDetailsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory KycDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      KycDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.tradingLicense,
    required this.vatLicense,
    required this.approveStatus,
  });

  License tradingLicense;
  License vatLicense;
  int approveStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tradingLicense: License.fromJson(json["trading_license"]),
        vatLicense: License.fromJson(json["vat_license"]),
        approveStatus: json["approve_status"],
      );
}

class License {
  License({
    required this.img,
    required this.expDate,
    required this.expStatus,
  });

  String img;
  DateTime? expDate;
  int expStatus;

  factory License.fromJson(Map<String, dynamic> json) => License(
        img: json["img"],
        expDate:
            json["exp_date"] == "" ? null : DateTime.parse(json["exp_date"]),
        expStatus: json["exp_status"],
      );
}
