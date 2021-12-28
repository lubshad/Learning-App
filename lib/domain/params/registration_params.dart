import 'dart:io';

import 'package:learning_app/domain/entities/platform.dart';
import 'package:equatable/equatable.dart';

class RegistrationParams extends Equatable {
  final String name;
  final String phoneNumber;
  final Map<String, File> images;
  final DevicePlatform platform;
  final String fcm;
  final String regionId;

  const RegistrationParams({
    required this.regionId,
    required this.platform,
    required this.fcm,
    required this.images,
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, phoneNumber];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phoneNumber,
      "platform": platform.index,
      "fcm": fcm,
      "region_id": regionId
    };
  }
}
