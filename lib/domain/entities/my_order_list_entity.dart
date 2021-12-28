// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class MyOrderListEntity extends Equatable {
  final String order_id;
  final String delivery_location;
  final String purchase_date;
  final String item_count;
  final String item_total;
  final String payment_mode;
  final String delivery_status;
  final String? delivery_date;
  final String? expected_date;

  const MyOrderListEntity(
      {required this.order_id,
      required this.delivery_location,
      required this.purchase_date,
      required this.item_count,
      required this.item_total,
      required this.payment_mode,
      required this.delivery_status,
      this.delivery_date,
      this.expected_date});

  @override
  List<Object?> get props => [
        order_id,
        delivery_location,
        purchase_date,
        item_count,
        item_total,
        payment_mode,
        delivery_status,
        delivery_date
      ];
}
