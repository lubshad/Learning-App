import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String addressId;
  final String address;
  final String street;
  final String phoneNumber;
  // final AddressType addressType;
  final String latitude;
  final String longitude;
  final String isDefault;

  const AddressEntity({
    required this.addressId,
    required this.isDefault,
    required this.latitude,
    required this.longitude,
    // required this.addressType,
    required this.address,
    required this.street,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [address, street];
}

// enum AddressType {
//   verified,
//   pendingVerification,
// }
