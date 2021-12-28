

class ProductDetailsParams {
  final String stockId;

  ProductDetailsParams({required this.stockId});


  Map<String, dynamic> toMap() {
    return {
      'stock_id': stockId,
    };
  }
}
