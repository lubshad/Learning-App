import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;
  final String imageUrl;
  final String id;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, id];

  Map<String, dynamic> toMap() => {"cat_id": id};
}

class SubCategoryEntity {
  final String name;
  List<ProductEntity> products;

  SubCategoryEntity({required this.name, required this.products});
}
