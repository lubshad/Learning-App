import 'package:equatable/equatable.dart';

class PaymentMethodEntity extends Equatable {
  final String text;
  final String code;

  const PaymentMethodEntity({required this.text, required this.code});

  @override
  List<Object?> get props => [text, code];
}

enum PaymentType { cashOnDelivery, payOnline }
