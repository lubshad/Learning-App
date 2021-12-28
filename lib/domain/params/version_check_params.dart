import 'dart:convert';
import 'package:learning_app/domain/entities/platform.dart';

class VersionCheckParams {
  String version;
  DevicePlatform platform;

  VersionCheckParams({required this.version, required this.platform});

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'platform': platform.index,
    };
  }

  String toJson() => json.encode(toMap());
}
