import 'package:learning_app/domain/entities/filter_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterController extends ChangeNotifier {
  FilterScreenArguments filterScreenArguments = Get.arguments;

  late List<FilterEntity> filters = filterScreenArguments.filters;

  resetFilters() {
    for (var items in filters) {
      for (var filterItem in items.filterItems) {
        filterItem.selected = false;
      }
    }
    notifyListeners();
  }

  changeType(FilterTypeEntity type) {
    for (var element in filters) {
      element.filterTypeEntity.selected =
          element.filterTypeEntity == type ? true : false;
    }
    notifyListeners();
  }

  changeSelection(FilterItemEntity item, bool value) {
    filters
        .singleWhere((element) => element.filterTypeEntity.selected)
        .filterItems
        .singleWhere((element) => element == item)
        .selected = value;
    notifyListeners();
  }

  setFilters() {
    filterScreenArguments.applyFilters(filters);
    Get.back();
  }

  clearFilters() {
    resetFilters();
    filterScreenArguments.applyFilters(filters);
    Get.back();
  }
}

Iterable<FilterEntity> filterEntities = [
  FilterEntity(
    filterTypeEntity: FilterTypeEntity(text: 'Size', selected: true, id: "0"),
    filterItems: [
      FilterItemEntity(itemText: "Small", id: "0"),
      FilterItemEntity(itemText: "Medium", id: "0"),
      FilterItemEntity(itemText: "Large", id: "0"),
    ],
  ),
  FilterEntity(
    filterTypeEntity: FilterTypeEntity(text: 'Flavour', id: "0"),
    filterItems: [
      FilterItemEntity(itemText: "Vanilla", id: "0"),
      FilterItemEntity(itemText: "Strawberry", id: "0"),
      FilterItemEntity(itemText: "Sharja", id: "0"),
    ],
  ),
];
