import 'package:equatable/equatable.dart';

class ExpectedDeliveryEntity extends Equatable {
  final String expDeliveryText;

  const ExpectedDeliveryEntity({required this.expDeliveryText});

  @override
  List<Object?> get props => [expDeliveryText];
}
