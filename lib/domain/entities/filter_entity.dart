import 'package:equatable/equatable.dart';

class FilterEntity extends Equatable {
  final FilterTypeEntity filterTypeEntity;
  final List<FilterItemEntity> filterItems;

  const FilterEntity({required this.filterTypeEntity, required this.filterItems});

  @override
  List<Object?> get props => [
        filterTypeEntity,
        filterItems,
      ];
}

// ignore: must_be_immutable
class FilterTypeEntity extends Equatable {
  final String text;
  final String id;
  bool selected;

  FilterTypeEntity({required this.id, required this.text, this.selected = false});

  @override
  List<Object?> get props => [text];
}

// ignore: must_be_immutable
class FilterItemEntity extends Equatable {
  final String itemText;
  final String id;
  bool selected;

  FilterItemEntity({required this.id, required this.itemText, this.selected = false});

  @override
  List<Object?> get props => [itemText, selected, id];
}

class FilterScreenArguments {
  final List<FilterEntity> filters;
  final Function(List<FilterEntity>) applyFilters;
  

  FilterScreenArguments({ required this.filters, required this.applyFilters});
}
