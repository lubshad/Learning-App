import 'package:equatable/equatable.dart';

class BillDetailsEntity extends Equatable {
  final String total;
  final String? itemTotal;
  final String? deliveryCharge;
  final String? discountAmount;
  final String? deliveryMsg;

  const BillDetailsEntity(
      {this.itemTotal,
      this.deliveryCharge,
      required this.total,
      this.discountAmount,
      this.deliveryMsg
      });

  @override
  List<Object?> get props => [total, itemTotal, deliveryCharge, discountAmount,deliveryMsg];
}
