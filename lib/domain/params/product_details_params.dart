

class ProductDetailsParams {
  final String courseId;

  ProductDetailsParams({required this.courseId});


  Map<String, dynamic> toMap() {
    return {
      'id': courseId,
    };
  }
}
