import 'package:equatable/equatable.dart';

class PriceRangeEntity extends Equatable {
  final String range;
  final String price;

  const PriceRangeEntity({required this.range, required this.price});

  @override
  List<Object?> get props => [range, price];
}
