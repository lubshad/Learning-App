import 'package:learning_app/domain/entities/filter_entity.dart';

class ProductListingParams {
  final String? categoryId;
  final String? subcategoryId;
  final int offset;
  final String? searchKey;
  final String? sortType;
  final List<FilterEntity> filters;

  ProductListingParams(
      {required this.sortType,
      required this.filters,
      this.searchKey,
      this.categoryId,
      this.subcategoryId,
      required this.offset});

  Map<String, dynamic> toMap() {
    return {
      'cat_id': categoryId,
      'subcat_id': subcategoryId,
      'offset': offset,
      "search_key": searchKey,
      "filter_apply": filters.isEmpty
          ? []
          : filters
              .map((e) => {
                    "key": e.filterTypeEntity.id,
                    "value": e.filterItems
                        .where((element) => element.selected)
                        .map((e) => e.id)
                        .toList()
                  })
              .toList(),
      "sort_by": sortType!,
    };
  }
}
