// To parse this JSON data, do
//
//     final viewWishListResponseModel = viewWishListResponseModelFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:learning_app/domain/entities/product_entity.dart';

ViewWishListResponseModel viewWishListResponseModelFromJson(String str) =>
    ViewWishListResponseModel.fromJson(json.decode(str));

String viewWishListResponseModelToJson(ViewWishListResponseModel data) =>
    json.encode(data.toJson());

class ViewWishListResponseModel {
  ViewWishListResponseModel({
    this.status,
    this.wishlistCount,
    this.cartCount,
    this.totalAmount,
    this.products,
    this.elapsedTime,
  });

  int? status;
  int? wishlistCount;
  int? cartCount;
  String? totalAmount;
  List<Product>? products;
  String? elapsedTime;

  factory ViewWishListResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewWishListResponseModel(
        status: json["status"],
        wishlistCount: json["wishlist_count"],
        cartCount: json["cart_count"],
        totalAmount: json["total_amount"].toString(),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        elapsedTime: json["elapsed_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "wishlist_count": wishlistCount,
        "cart_count": cartCount,
        "total_amount": totalAmount,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "elapsed_time": elapsedTime,
      };
}

// ignore: must_be_immutable
class Product extends ProductEntity {
  Product({
    this.productId,
    this.wishlistDetailsId,
    this.vendorId,
    this.productName,
    this.stockId,
    this.productCode,
    this.productImg,
    this.price,
    this.cutPrice,
    this.offerPercent,
    this.quantity,
    this.stockAvailable,
  }) : super(
            stockId: stockId,
            name: productName!,
            imageUrl: productImg!,
            price: price,
            qty: quantity,
            vendorId: vendorId,
            wishListDetailsId: wishlistDetailsId,
            stockAvailable: stockAvailable);

  String? productId;
  String? wishlistDetailsId;
  @override
  String? vendorId;
  String? productName;
  @override
  String? stockId;
  String? productCode;
  String? productImg;
  @override
  String? price;
  String? cutPrice;
  int? offerPercent;
  String? quantity;
  // ignore: annotate_overrides
  String? stockAvailable;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        wishlistDetailsId: json["wishlist_details_id"],
        vendorId: json["vendor_id"],
        productName: json["product_name"],
        stockId: json["stock_id"],
        productCode: json["product_code"],
        productImg: json["product_img"],
        price: json["price"],
        cutPrice: json["cut_price"],
        offerPercent: json["offer_percent"],
        quantity: json["quantity"],
        stockAvailable: json["stock_available"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "wishlist_details_id": wishlistDetailsId,
        "vendor_id": vendorId,
        "product_name": productName,
        "stock_id": stockId,
        "product_code": productCode,
        "product_img": productImg,
        "price": price,
        "cut_price": cutPrice,
        "offer_percent": offerPercent,
        "quantity": quantity,
        "stock_available": stockAvailable,
      };
}
