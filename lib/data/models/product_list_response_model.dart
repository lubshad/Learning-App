// To parse this JSON data, do
//
//     final productListingResponseModel = productListingResponseModelFromJson(jsonString);

// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:learning_app/domain/entities/filter_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';

ProductListingResponseModel productListingResponseModelFromJson(String str) =>
    ProductListingResponseModel.fromJson(json.decode(str));

String productListingResponseModelToJson(ProductListingResponseModel data) =>
    json.encode(data.toJson());

class ProductListingResponseModel {
  ProductListingResponseModel({
    required this.status,
    required this.message,
    required this.productsCount,
    required this.data,
  });

  int status;
  String message;
  int productsCount;
  Data? data;

  factory ProductListingResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductListingResponseModel(
        status: json["status"],
        message: json["message"],
        productsCount: json["products_count"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products_count": productsCount,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.products,
    required this.filterArray,
  });

  List<Product> products;
  List<FilterArray> filterArray;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        filterArray: List<FilterArray>.from(
            json["filter_array"].map((x) => FilterArray.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "filter_array": List<dynamic>.from(filterArray.map((x) => x.toJson())),
      };
}

class FilterArray extends FilterEntity {
  FilterArray({
    required this.filterId,
    required this.varientId,
    required this.filterType,
    required this.filterItems,
  }) : super(
            filterTypeEntity: FilterTypeEntity(text: filterType, id: filterId),
            filterItems: filterItems);

  String filterId;
  String varientId;
  String filterType;
  List<FilterItem> filterItems;

  factory FilterArray.fromJson(Map<String, dynamic> json) => FilterArray(
        filterId: json["filter_id"],
        varientId: json["varient_id"],
        filterType: json["filter_type"],
        filterItems: List<FilterItem>.from(
            json["filter_items"].map((x) => FilterItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filter_id": filterId,
        "varient_id": varientId,
        "filter_type": filterType,
        "filter_items": List<dynamic>.from(filterItems.map((x) => x.toJson())),
      };
}

class FilterItem extends FilterItemEntity {
  FilterItem({
    required this.id,
    this.name,
  }) : super(id: id, itemText: name ?? "");

  String id;
  String? name;

  factory FilterItem.fromJson(Map<String, dynamic> json) => FilterItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Product extends ProductEntity {
  Product({
    required this.productId,
    required this.productName,
    required this.brand,
    required this.stockId,
    required this.productCode,
    required this.productImg,
    required this.stockStatus,
    required this.price,
    required this.cutPrice,
    required this.offerPercent,
    required this.userQty,
    required this.isWishlist,
  }) : super(
            name: productName,
            imageUrl: productImg,
            price: price.toString(),
            stockId: stockId);

  String productId;
  String productName;
  String? brand;
  String stockId;
  String productCode;
  String productImg;
  String stockStatus;
  String price;
  String cutPrice;
  String offerPercent;
  String userQty;
  int isWishlist;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        isWishlist: json["is_wishlist"],
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
        "is_wishlist": isWishlist,
      };
}
