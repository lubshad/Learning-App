// To parse this JSON data, do
//
//     final subcategoriesResponseModel = subcategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:learning_app/domain/entities/category_entity.dart';

SubcategoriesResponseModel subcategoriesResponseModelFromJson(String str) =>
    SubcategoriesResponseModel.fromJson(json.decode(str));

String subcategoriesResponseModelToJson(SubcategoriesResponseModel data) =>
    json.encode(data.toJson());

class SubcategoriesResponseModel {
  SubcategoriesResponseModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory SubcategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      SubcategoriesResponseModel(
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
    this.subCategories,
  });

  List<SubCategory>? subCategories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subCategories: List<SubCategory>.from(
            json["sub_categories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sub_categories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class SubCategory extends CategoryEntity {
  SubCategory({
    this.subcatId,
    this.subcatName,
    this.image,
  }) : super(id: subcatId!, name: subcatName!, imageUrl: image!);

  String? subcatId;
  String? subcatName;
  String? image;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subcatId: json["subcat_id"],
        subcatName: json["subcat_name"],
        image: json["image"],
      );

  // ignore: annotate_overrides
  Map<String, dynamic> toJson() => {
        "subcat_id": subcatId,
        "subcat_name": subcatName,
        "image": image,
      };
}
