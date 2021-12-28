import 'dart:convert';

import 'package:equatable/equatable.dart';

class TravelAllowanceParams extends Equatable {
  final String fromLocation;
  final String toLocation;
  final String distance;
  final List<String> selectedProjects;
  final TravelType travelType;
  final DateTime date;

  const TravelAllowanceParams({required this.fromLocation, required this.toLocation,required  this.distance, required  this.selectedProjects, required this.travelType, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'distance': distance,
      'selectedProjects': selectedProjects,
      'travelType': travelType.toMap(),
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory TravelAllowanceParams.fromMap(Map<String, dynamic> map) {
    return TravelAllowanceParams(
      fromLocation: map['fromLocation'],
      toLocation: map['toLocation'],
      distance: map['distance'],
      selectedProjects: List<String>.from(map['selectedProjects']),
      travelType: TravelType.bus,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelAllowanceParams.fromJson(String source) => TravelAllowanceParams.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
    fromLocation, toLocation, date, distance, selectedProjects, travelType
  ];
}


enum TravelType {
  bus,
  train,
  auto,
  bike,
  car,
}

extension TravelTypeExtension on TravelType {
  String get typeToString {
    switch(this) {
      case TravelType.bus:
        return "Bus";
      case TravelType.train:
        return "Train";
      case TravelType.auto:
        return "Auto";
      case TravelType.bike:
        return "Bike";
      case TravelType.car:
        return "Car";
    }
  }

  toMap() {

  }
}
