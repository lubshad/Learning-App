import 'package:learning_app/domain/entities/filter_entity.dart';
import 'package:learning_app/presentation/screens/filter_screen/filter_controller.dart';
import 'package:flutter/material.dart';

class FilterItemsList extends StatelessWidget {
  const FilterItemsList({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final FilterController filterController;

  @override
  Widget build(BuildContext context) {
    final FilterEntity selectedFilterType = filterController.filters
        .singleWhere((element) => element.filterTypeEntity.selected);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(selectedFilterType.filterItems.length, (index) {
            final FilterItemEntity filterItemEntity =
                selectedFilterType.filterItems[index];
            return CheckboxListTile(
              value: filterItemEntity.selected,
              onChanged: (value) =>
                  filterController.changeSelection(filterItemEntity, value!),
              title: Text(filterItemEntity.itemText),
            );
          })
        ],
      ),
    );
  }
}
