import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';

import 'home_category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (categories.isNotEmpty)
          HeaderWithPadding(
            text: AppLocalizations.of(context)!.categories,
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              children: [
                ...List.generate(
                    categories.length,
                    (index) =>
                        HomeCategoryItem(categoryEntity: categories[index])),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
