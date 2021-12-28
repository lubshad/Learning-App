import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/domain/entities/price_range_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? name;
  final String? imageUrl;
  final String? price;
  final String? qty;
  final String? total;
  final String? stockId;
  final String? cartDetailsId;
  final String? vendorId;
  final String? wishListDetailsId;
  final String? wishlistStatus;
  final String? userQty;
  final String? stockAvailable;
  final List<PriceRangeEntity>? priceRange;
  final String? mrp;

  const ProductEntity(
      {this.mrp,
      this.userQty,
      this.wishlistStatus,
      this.name,
      this.imageUrl,
      this.price,
      this.qty,
      this.total,
      this.stockId,
      this.cartDetailsId,
      this.vendorId,
      this.wishListDetailsId,
      this.priceRange,
      this.stockAvailable});

  @override
  List<Object?> get props => [name, imageUrl, price, stockId];
}

class TitleWithCoursesEntity extends Equatable {
  final String title;
  final List<Course> cources;

  const TitleWithCoursesEntity({required this.title, required this.cources});

  @override
  List<Object?> get props => [title, cources];
}
