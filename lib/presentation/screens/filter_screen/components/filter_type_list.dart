import 'package:learning_app/domain/entities/filter_entity.dart';
import 'package:learning_app/presentation/screens/filter_screen/filter_controller.dart';
import 'package:flutter/material.dart';

class FilterTypeList extends StatelessWidget {
  const FilterTypeList({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final FilterController filterController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(filterController.filters.length, (index) {
            final FilterTypeEntity filterTypeEntity =
                filterController.filters[index].filterTypeEntity;
            return ListTile(
              onTap: () => filterController.changeType(filterTypeEntity),
              selected: filterTypeEntity.selected,
              title: Text(filterTypeEntity.text),
            );
          })
        ],
      ),
    );
  }
}
