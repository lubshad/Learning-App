// To parse this JSON data, do
//
//     final homeResponseModel = homeResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) =>
    json.encode(data.toJson());

class HomeResponseModel {
  HomeResponseModel({
    required this.statusCode,
    required this.status,
    required this.banner,
    required this.horizontalSlider,
    required this.message,
  });

  final int statusCode;
  final bool status;
  final Banner banner;
  final List<HorizontalSlider?> horizontalSlider;
  final String message;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        statusCode: json["status_code"],
        status: json["status"],
        banner: Banner.fromJson(json["banner"]),
        horizontalSlider:
            List<HorizontalSlider?>.from(json["horizontal_slider"].map((x) {
          if (x["heading"] != null) {
            return HorizontalSlider.fromJson(x);
          }
        })),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "banner": banner.toJson(),
        "horizontal_slider":
            List<dynamic>.from(horizontalSlider.map((x) => x!.toJson())),
        "message": message,
      };
}

class Banner extends BannerEntity {
  Banner({
    required this.banner,
    required this.bannerTitle,
  }) : super(image: banner, onTap: () {});

  final String banner;
  final String bannerTitle;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        banner: json["banner"],
        bannerTitle: json["banner_title"],
      );

  Map<String, dynamic> toJson() => {
        "banner": banner,
        "banner_title": bannerTitle,
      };
}

class HorizontalSlider extends TitleWithCoursesEntity {
  HorizontalSlider({
    required this.heading,
    required this.nameSlug,
    required this.typeImage,
    required this.createdAt,
    required this.updatedAt,
    required this.data,
  }) : super(cources: data, title: heading);

  final String heading;
  final String nameSlug;
  final dynamic typeImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Course> data;

  factory HorizontalSlider.fromJson(Map<String, dynamic> json) =>
      HorizontalSlider(
        heading: json["heading"],
        nameSlug: json["name_slug"],
        typeImage: json["type_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        data: List<Course>.from(json["data"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "name_slug": nameSlug,
        "type_image": typeImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Course {
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.listingImage,
    required this.actualPrice,
    required this.price,
    required this.currency,
    required this.currencyCode,
    required this.rating,
    required this.ratingCount,
    this.cartCount = 1,
  });

  final int id;
  final String title;
  final String description;
  final String listingImage;
  final String actualPrice;
  final String price;
  final int currency;
  final String currencyCode;
  final dynamic rating;
  final int ratingCount;
  int cartCount;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        listingImage: json["listing_image"],
        actualPrice: json["actual_price"],
        price: json["price"],
        currency: json["currency"],
        currencyCode: json["currency_code"],
        rating: json["rating"],
        ratingCount: json["rating_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "listing_image": listingImage,
        "actual_price": actualPrice,
        "price": price,
        "currency": currency,
        "currency_code": currencyCode,
        "rating": rating,
        "rating_count": ratingCount,
      };
}
