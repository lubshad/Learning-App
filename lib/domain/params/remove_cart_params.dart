import 'package:equatable/equatable.dart';

class RemoveCartParams extends Equatable {
  final String cartDetailId;

  const RemoveCartParams({required this.cartDetailId});

  @override
  List<Object?> get props => [cartDetailId];

  Map<String, dynamic> toMap() => {"cart_detail_id": cartDetailId};
}
