class OrderDetailsParams {
  final String orderId;

  OrderDetailsParams({required this.orderId});

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
    };
  }
}
