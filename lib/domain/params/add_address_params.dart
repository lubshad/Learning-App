import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AddAddressParams extends Equatable {
  final String? addressId;
  final String address;
  final String street;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final String sessionId;
  final String userId;

  const AddAddressParams({
    this.addressId,
    required this.sessionId,
    required this.userId,
    required this.address,
    required this.street,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props =>
      [address, phoneNumber, latitude, longitude, street];

  Map<String, dynamic> toMap() {
    return {
      "session_id": sessionId,
      "user_id": userId,
      'address': address,
      'street': street,
      'phone': phoneNumber,
      'lat': latitude,
      'long': longitude,
      "address_id": addressId,
    };
  }
}

enum AddAddressType { registration, changeAddress }

class AddAddressArguments {
  final AddAddressType addAddressType;
  final UserEntity user;

  AddAddressArguments({required this.addAddressType, required this.user});
}
