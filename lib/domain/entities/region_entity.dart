import 'package:equatable/equatable.dart';

class RegionEntity extends Equatable {
  final String id;
  final String regionName;

  const RegionEntity({required this.id, required this.regionName});

  @override
  List<Object?> get props => [id, regionName];
}