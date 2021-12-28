import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceCostParams extends Equatable {
  final String remarks;
  final String billAmount;
  final DateTime date;
  final String imageUrl;
  final List<String> selectedProjects;

  const ServiceCostParams({required this.remarks, required this.billAmount, required this.date, required this.imageUrl, required this.selectedProjects});

  @override
  List<Object?> get props => [remarks, billAmount, date, imageUrl, selectedProjects];

  Map<String, dynamic> toMap() {
    return {
      'remarks': remarks,
      'billAmount': billAmount,
      'date': date.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
      'selectedProjects': selectedProjects,
    };
  }

  factory ServiceCostParams.fromMap(Map<String, dynamic> map) {
    return ServiceCostParams(
      remarks: map['remarks'],
      billAmount: map['billAmount'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      imageUrl: map['imageUrl'],
      selectedProjects: List<String>.from(map['selectedProjects']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCostParams.fromJson(String source) => ServiceCostParams.fromMap(json.decode(source));
}
