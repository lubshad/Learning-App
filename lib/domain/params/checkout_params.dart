class CheckOutParams {
  final String cartId;

  CheckOutParams({required this.cartId});

  Map<String, dynamic> toMap() {
    return {
      'cart_id': cartId,
    };
  }
}
