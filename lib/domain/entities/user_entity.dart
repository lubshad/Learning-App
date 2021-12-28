import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String sessionId;
  final String userId;
  final String phone;
  final String imageUrl;
  final int registrationStatus;

  const UserEntity({
    required this.registrationStatus,
    required this.name,
    required this.sessionId,
    required this.userId,
    required this.phone,
    required this.imageUrl,
  });

  factory UserEntity.fromJson(Map<String, dynamic> userJson) {
    return UserEntity(
      registrationStatus: userJson["registration_status"],
      name: userJson["customer_name"],
      sessionId: userJson["session_value"],
      userId: userJson["customer_id"],
      imageUrl: userJson["shop_image"],
      phone: userJson["customer_phone"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> userJson = {};
    userJson.addAll({
      "registration_status": registrationStatus,
      "customer_name": name,
      "session_value": sessionId,
      "customer_id": userId,
      "customer_phone": phone,
      "shop_image": imageUrl,
    });
    return userJson;
  }

  @override
  List<Object?> get props => [name, userId];
}

enum RegistrationStatus {
  registered,
  kycUploaded,
  addressAdded,
  verified,
}


