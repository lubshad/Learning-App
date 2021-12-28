// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';

HomeResponseModel homeResponseFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeResponseToJson(HomeResponseModel data) => json.encode(data.toJson());

class HomeResponseModel {
  HomeResponseModel({
    this.status,
    this.message,
    this.data,
    this.notAvailableImageUrl,
  });

  int? status;
  String? message;
  Data? data;
  String? notAvailableImageUrl;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
          // status: 2,
          status: json["status"],
          message: json["message"],
          data: Data.fromJson(json["data"]),
          notAvailableImageUrl: json["not_available_image_url"]);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.banners,
    this.categories,
    this.products,
  });

  List<Banner>? banners;
  List<Category>? categories;
  List<Product>? products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.bannerId,
    this.bannerImage,
    this.bannerLink,
  });

  String? bannerId;
  String? bannerImage;
  String? bannerLink;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerId: json["banner_id"].toString(),
        bannerImage: json["banner_image"],
        bannerLink: json["banner_link"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_image": bannerImage,
        "banner_link": bannerLink,
      };
}

// ignore: must_be_immutable
class Category extends CategoryEntity {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.displayOrder,
  }) : super(name: categoryName!, imageUrl: categoryImage!, id: categoryId!);

  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? displayOrder;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        displayOrder: json["display_order"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "display_order": displayOrder,
      };
}

// ignore: must_be_immutable
class Product extends TitleWithProductsEntity {
  Product({
    this.name,
    this.id,
    this.data,
  }) : super(title: name!, products: data!);

  String? name;
  String? id;
  List<Datum>? data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        id: json["id"].toString(),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class Datum extends ProductEntity {
  Datum({
    this.productId,
    this.productName,
    this.brand,
    required this.stockId,
    this.productCode,
    this.productImg,
    this.stockStatus,
    this.price,
    this.cutPrice,
    this.offerPercent,
    this.userQty,
  }) : super(
            price: price!,
            name: productName!,
            imageUrl: productImg!,
            stockId: stockId,
            userQty: userQty);

  final String? productId;
  final String? productName;
  final String? brand;
  // ignore: duplicate_ignore
  // ignore: overridden_fields
  final String stockId;
  final String? productCode;
  final String? productImg;
  final String? stockStatus;
  String? price;
  final String? cutPrice;
  final String? offerPercent;
  final String? userQty;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        productName: json["product_name"],
        brand: json["brand"],
        stockId: json["stock_id"],
        productCode: json["product_code"],
        productImg: json["product_img"],
        stockStatus: json["stock_status"],
        price: json["price"].toString(),
        cutPrice: json["cut_price"].toString(),
        offerPercent: json["offer_percent"].toString(),
        userQty: json["user_qty"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "brand": brand,
        "stock_id": stockId,
        "product_code": productCode,
        "product_img": productImg,
        "stock_status": stockStatus,
        "price": price,
        "cut_price": cutPrice,
        "offer_percent": offerPercent,
        "user_qty": userQty,
      };
}
