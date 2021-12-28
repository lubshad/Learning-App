import 'package:learning_app/domain/entities/price_range_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class PriceRangeItem extends StatelessWidget {
  const PriceRangeItem({
    Key? key,
    required this.priceRangeEntity,
  }) : super(key: key);

  final PriceRangeEntity priceRangeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  priceRangeEntity.range,
                )),
            Expanded(
                flex: 3,
                child: Text(priceRangeEntity.price
                    //  +
                    //     " " +
                    //     AppLocalizations.of(context)!.currency,
                    )),
          ],
        ),
        defaultSpacerSmall
      ],
    );
  }
}
