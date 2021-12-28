import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String phone;
  final String? otp;

  const AuthParams({this.otp, required this.phone});

  Map<String, dynamic> toMap() {
    return {"phone": phone, "otp": otp};
  }

  factory AuthParams.fromMap(Map<String, dynamic> map) {
    return AuthParams(phone: map["phone"], otp: map["otp"]);
  }
  

  factory AuthParams.fromJson(String source) =>
      AuthParams.fromMap(json.decode(source));

  @override
  List<Object?> get props => [phone, otp];
}
