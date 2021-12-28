import 'package:equatable/equatable.dart';

class WishlistItemEntity  extends Equatable {
  final int id;
  final String name;
  final String price;
  final String imageUrl;

  const WishlistItemEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id,name, price, imageUrl];
}
