// To parse this JSON data, do
//
//     final myAddressResponseModel = myAddressResponseModelFromJson(jsonString);

// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:learning_app/domain/entities/address_entity.dart';

MyAddressResponseModel myAddressResponseModelFromJson(String str) =>
    MyAddressResponseModel.fromJson(json.decode(str));

String myAddressResponseModelToJson(MyAddressResponseModel data) =>
    json.encode(data.toJson());

class MyAddressResponseModel {
  MyAddressResponseModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory MyAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      MyAddressResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.address,
  });

  List<Address>? address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": List<dynamic>.from(address!.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class Address extends AddressEntity {
  Address({
    required this.phoneNumber,
    required this.addressId,
    this.customerAddress,
    required this.latitude,
    required this.longitude,
    this.customerLandmark,
    required this.isDefault,
  }) : super(
          addressId: addressId,
          latitude: latitude,
          longitude: longitude,
          address: customerAddress!,
          street: customerLandmark!,
          phoneNumber: phoneNumber,
          isDefault: isDefault,
        );

  String addressId;
  String? customerAddress;
  String latitude;
  String longitude;
  String? customerLandmark;
  String phoneNumber;
  String isDefault;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json["address_id"],
        customerAddress: json["customer_address"],
        latitude: (json["latitude"]),
        longitude: json["longitude"],
        customerLandmark: json["customer_landmark"],
        phoneNumber: json["customer_phone"] ?? "",
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "customer_phone": phoneNumber,
        "address_id": addressId,
        "customer_address": customerAddress,
        "latitude": latitude,
        "longitude": longitude,
        "is_default": 1,
        "customer_landmark": customerLandmark,
      };
}
