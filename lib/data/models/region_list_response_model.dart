// To parse this JSON data, do
//
//     final regionListResponseModel = regionListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:learning_app/domain/entities/region_entity.dart';

RegionListResponseModel regionListResponseModelFromJson(String str) =>
    RegionListResponseModel.fromJson(json.decode(str));

String regionListResponseModelToJson(RegionListResponseModel data) =>
    json.encode(data.toJson());

class RegionListResponseModel {
  RegionListResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory RegionListResponseModel.fromJson(Map<String, dynamic> json) =>
      RegionListResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.regions,
  });

  List<Region> regions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
      };
}

class Region extends RegionEntity {
  const Region({
    required this.regId,
    required this.regName,
  }) : super(id: regId, regionName: regName);

  final String regId;
  final String regName;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        regId: json["reg_id"],
        regName: json["reg_name"],
      );

  Map<String, dynamic> toJson() => {
        "reg_id": regId,
        "reg_name": regName,
      };
}
