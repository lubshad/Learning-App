// To parse this JSON data, do
//
//     final productDetailsResponseModel = productDetailsResponseModelFromJson(jsonString);
// ignore_for_file: must_be_immutable, overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:learning_app/domain/entities/price_range_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';

ProductDetailsResponseModel productDetailsResponseModelFromJson(String str) =>
    ProductDetailsResponseModel.fromJson(json.decode(str));

String productDetailsResponseModelToJson(ProductDetailsResponseModel data) =>
    json.encode(data.toJson());

class ProductDetailsResponseModel {
  ProductDetailsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponseModel(
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
    required this.productId,
    required this.productName,
    required this.productImages,
    required this.variant1Name,
    required this.variant1S,
    required this.productDescription,
    required this.productFeatures,
    required this.productDetails,
  });

  String productId;
  String productName;
  List<ProductImage> productImages;
  String variant1Name;
  List<Variant1> variant1S;
  String productDescription;
  String productFeatures;
  String productDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        productName: json["product_name"],
        productImages: List<ProductImage>.from(
            json["product_images"].map((x) => ProductImage.fromJson(x))),
        variant1Name: json["variant1_name"],
        variant1S: List<Variant1>.from(
            json["variant1s"].map((x) => Variant1.fromJson(x))),
        productDescription: json["product_description"],
        productFeatures: json["product_features"],
        productDetails: json["product_details"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_images":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "variant1_name": variant1Name,
        "variant1s": List<dynamic>.from(variant1S.map((x) => x.toJson())),
        "product_description": productDescription,
        "product_features": productFeatures,
        "product_details": productDetails,
      };
}

class ProductImage {
  ProductImage({
    required this.key,
    required this.image,
  });

  int key;
  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        key: json["key"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "image": image,
      };
}

class Variant1 {
  Variant1({
    required this.variant1Name,
    required this.vendors,
  });

  String variant1Name;
  List<Vendor> vendors;

  factory Variant1.fromJson(Map<String, dynamic> json) => Variant1(
        variant1Name: json["variant1_name"],
        vendors:
            List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "variant1_name": variant1Name,
        "vendors": List<dynamic>.from(vendors.map((x) => x.toJson())),
      };
}

class Vendor extends ProductEntity {
  Vendor({
    required this.vendorName,
    required this.vendorId,
    required this.productName,
    required this.vendorLogo,
    required this.stockId,
    required this.varientCutPrice,
    required this.varientPrice,
    required this.offerPercent,
    required this.userQty,
    required this.wishlistStatus,
    required this.varientQuantity,
    required this.convenientCharge,
    required this.expectedDelivery,
    required this.skuCode,
    required this.shareLink,
    required this.rewardPoint,
    required this.priceRanges,
  }) : super(
            stockId: stockId,
            name: productName,
            imageUrl: "",
            price: varientPrice,
            mrp: varientCutPrice,
            wishlistStatus: wishlistStatus);

  String vendorName;
  String vendorId;
  String productName;
  String vendorLogo;
  String stockId;
  String varientCutPrice;
  String varientPrice;
  String offerPercent;
  String userQty;
  String wishlistStatus;
  String varientQuantity;
  String convenientCharge;
  String expectedDelivery;
  String skuCode;
  String shareLink;
  String rewardPoint;
  List<PriceRange> priceRanges;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        vendorName: json["vendor_name"],
        vendorId: json["vendor_id"],
        productName: json["product_name"],
        vendorLogo: json["vendor_logo"],
        stockId: json["stock_id"],
        varientCutPrice: json["varient_cut_price"].toString(),
        varientPrice: json["varient_price"].toString(),
        offerPercent: json["offer_percent"].toString(),
        userQty: json["user_qty"],
        wishlistStatus: json["wishlist_status"],
        varientQuantity: json["varient_quantity"],
        convenientCharge: json["convenient_charge"],
        expectedDelivery: json["expected_delivery"],
        skuCode: json["sku_code"],
        shareLink: json["share_link"],
        rewardPoint: json["reward_point"],
        priceRanges:
            // json["price_ranges"]== null
            //     ? priceRangeSmallList
            //     :
            List<PriceRange>.from(
                json["price_range"].map((x) => PriceRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendor_name": vendorName,
        "vendor_id": vendorId,
        "product_name": productName,
        "vendor_logo": vendorLogo,
        "stock_id": stockId,
        "varient_cut_price": varientCutPrice,
        "varient_price": varientPrice,
        "offer_percent": offerPercent,
        "user_qty": userQty,
        "wishlist_status": wishlistStatus,
        "varient_quantity": varientQuantity,
        "convenient_charge": convenientCharge,
        "expected_delivery": expectedDelivery,
        "sku_code": skuCode,
        "share_link": shareLink,
        "reward_point": rewardPoint,
      };
}

class PriceRange extends PriceRangeEntity {
  PriceRange({
    required this.range,
    required this.price,
  }) : super(range: range, price: price);

  String range;
  String price;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        range: json["range"],
        price: json["price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "range": range,
        "price": price,
      };
}

List<PriceRange> priceRangeSmallList = [
  PriceRange(range: "1-10", price: "30.00"),
  PriceRange(range: "10-20", price: "25.00"),
  PriceRange(range: "20-100", price: "20.00"),
  PriceRange(range: "100+", price: "18.00"),
];
