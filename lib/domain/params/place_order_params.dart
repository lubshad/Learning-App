import 'package:learning_app/domain/entities/platform.dart';
import 'package:equatable/equatable.dart';

class PlaceOrderParams extends Equatable {
  final String cartId;
  final String paymentOption;
  final String addressId;
  final DevicePlatform platform;

  const PlaceOrderParams(
      {required this.platform,
      required this.cartId,
      required this.paymentOption,
      required this.addressId});

  @override
  List<Object?> get props => [cartId, paymentOption, addressId, platform.index];

  Map<String, dynamic> toMap() {
    return {
      "platform": platform.index,
      'cart_id': cartId,
      'payment_option': paymentOption,
      'address_id': addressId,
    };
  }
}
