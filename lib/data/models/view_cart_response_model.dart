// To parse this JSON data, do
//
//     final viewCartResponseModel = viewCartResponseModelFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:learning_app/domain/entities/product_entity.dart';

import 'product_details_response_model.dart';

ViewCartResponseModel viewCartResponseModelFromJson(String str) =>
    ViewCartResponseModel.fromJson(json.decode(str));

String viewCartResponseModelToJson(ViewCartResponseModel data) =>
    json.encode(data.toJson());

class ViewCartResponseModel {
  ViewCartResponseModel({
    this.status,
    this.wishlistCount,
    this.cartCount,
    this.cartId,
    this.itemTotal,
    this.totalAmount,
    this.deliveryTotal,
    this.products,
    this.elapsedTime,
  });

  int? status;
  int? wishlistCount;
  int? cartCount;
  String? cartId;
  String? itemTotal;
  String? totalAmount;
  String? deliveryTotal;
  List<Product>? products;
  String? elapsedTime;

  factory ViewCartResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewCartResponseModel(
        status: json["status"],
        wishlistCount: json["wishlist_count"],
        cartCount: json["cart_count"],
        cartId: json["cart_id"],
        itemTotal: json["item_total"].toString(),
        totalAmount: json["total_amount"].toString(),
        deliveryTotal: json["delivery_total"].toString(),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        elapsedTime: json["elapsed_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "wishlist_count": wishlistCount,
        "cart_count": cartCount,
        "cart_id": cartId,
        "item_total": itemTotal,
        "total_amount": totalAmount,
        "delivery_total": deliveryTotal,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "elapsed_time": elapsedTime,
      };
}

// ignore: must_be_immutable
class Product extends ProductEntity {
  Product({
    this.cartDetailsId,
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
    this.totalAmount,
    this.priceRange,
  }) : super(
            name: productName!,
            imageUrl: productImg!,
            price: price,
            qty: quantity,
            stockId: stockId,
            cartDetailsId: cartDetailsId,
            vendorId: vendorId,
            total: totalAmount,
            priceRange: priceRange,
            stockAvailable: stockAvailable);

  String? productId;
  // ignore: annotate_overrides
  String? cartDetailsId;
  // ignore: annotate_overrides
  String? vendorId;
  String? productName;
  // ignore: annotate_overrides
  String? stockId;
  String? productCode;
  String? productImg;
  // ignore: annotate_overrides
  String? price;
  double? cutPrice;
  int? offerPercent;
  String? quantity;
  // ignore: annotate_overrides
  String? stockAvailable;
  String? totalAmount;
  // ignore: annotate_overrides
  List<PriceRange>? priceRange;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        cartDetailsId: json["cart_details_id"],
        vendorId: json["vendor_id"],
        productName: json["product_name"],
        stockId: json["stock_id"],
        productCode: json["product_code"],
        productImg: json["product_img"],
        price: json["price"].toString(),
        cutPrice: json["cut_price"].toDouble(),
        offerPercent: json["offer_percent"],
        quantity: json["quantity"].toString(),
        stockAvailable: json["stock_available"],
        totalAmount: json["total_amount"].toString(),
        priceRange: List<PriceRange>.from(
            json["price_range"].map((x) => PriceRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "cart_details_id": cartDetailsId,
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
        "total_amount": totalAmount,
        "price_range": List<dynamic>.from(priceRange!.map((x) => x.toJson())),
      };
}
