// To parse this JSON data, do
//
//     final linkTypeModel = linkTypeModelFromJson(jsonString);

import 'dart:convert';

LinkTypeModel linkTypeModelFromJson(String str) =>
    LinkTypeModel.fromJson(json.decode(str));

String linkTypeModelToJson(LinkTypeModel data) => json.encode(data.toJson());

class LinkTypeModel {
  LinkTypeModel({
    this.status,
    this.data,
  });

  final int? status;
  final Data? data;

  factory LinkTypeModel.fromJson(Map<String, dynamic> json) => LinkTypeModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.type,
    this.catId,
    this.subcatId,
    this.stockId,
    this.name,
    this.orderId,
    this.offerId,
  });

  final String? type;
  final String? catId;
  final String? subcatId;
  final String? stockId;
  final String? name;
  final String? offerId;
  final String? orderId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        type: json["type"],
        catId: json["categ_id"],
        subcatId: json["subcat_id"],
        stockId: json["stock_id"],
        name: json["name"],
        offerId: json["offer_id"],
      );

  Map<String, dynamic> toJson() => {
    "order_id" :orderId,
        "type": type,
        "categ_id": catId,
        "subcat_id": subcatId,
        "stock_id": stockId,
        "name": name,
        "offer_id": offerId,
      };
}
