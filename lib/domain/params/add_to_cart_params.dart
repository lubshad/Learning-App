import 'package:equatable/equatable.dart';

class CartWishlistParams extends Equatable {
  final String? stockId;
  final String? vendorID;
  final String? quantity;
  final String? wishlistDetailId;

  const CartWishlistParams({
    this.wishlistDetailId, 
       this.stockId,
       this.vendorID,
       this.quantity});

  @override
  List<Object?> get props => [stockId, vendorID, quantity, wishlistDetailId];

  Map<String, dynamic> toMap() => {
        "product_variant_id": stockId,
        "vendor_id": vendorID,
        "qty": quantity,
        "wishlist_detail_id" : wishlistDetailId
      };
}
