import 'package:learning_app/domain/entities/price_range_entity.dart';
import 'package:learning_app/presentation/screens/product_details_screen/components/price_range_item.dart';
import 'package:learning_app/presentation/screens/product_details_screen/components/price_range_title.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class PriceRanges extends StatelessWidget {
  const PriceRanges({
    Key? key,
    required this.priceRanges,
  }) : super(key: key);

  final List<PriceRangeEntity> priceRanges;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (priceRanges.isNotEmpty) const PriceRangeTitle(),
        defaultSpacerSmall,
        ...priceRanges.map((e) => PriceRangeItem(priceRangeEntity: e)).toList(),
      ],
    );
  }
}
