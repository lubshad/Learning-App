import 'package:equatable/equatable.dart';

class UpdateCartParams extends Equatable {
  final String productVariantId;
  final String quantity;
  final String vendorId;
  final String cartDetailId;

  const UpdateCartParams(
      {required this.productVariantId,
      required this.quantity,
      required this.vendorId,
      required this.cartDetailId});

  @override
  List<Object?> get props =>
      [productVariantId, quantity, vendorId, cartDetailId];

  Map<String, dynamic> toMap() => {
        "product_variant_id": productVariantId,
        "qty": quantity,
        "vendor_id": vendorId,
        "cart_detail_id": cartDetailId
      };
}
