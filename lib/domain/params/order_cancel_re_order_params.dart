import 'package:equatable/equatable.dart';

class OrderCancelReOrderParams extends Equatable {
  final String orderId;

  const OrderCancelReOrderParams({required this.orderId});

  @override
  List<Object?> get props => [orderId];

  Map<String, dynamic> toMap() => {"order_id": orderId};
}
