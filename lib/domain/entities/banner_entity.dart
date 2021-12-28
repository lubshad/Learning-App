import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String image;
  final Function onTap;

  const BannerEntity({required this.image, required this.onTap});

  @override
  List<Object> get props => [image];
}
