import 'package:learning_app/domain/entities/variant_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class VariantSelection extends StatelessWidget {
  const VariantSelection({
    Key? key,
    required this.variantEntity,
    required this.selectedVariant,
    required this.changeVariant,
  }) : super(key: key);

  final VariantEntity variantEntity;
  final VariantProduct selectedVariant;
  final Function(VariantProduct) changeVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          variantEntity.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        defaultSpacerSmall,
        Wrap(
          runSpacing: defaultPadding * .5,
          spacing: defaultPadding * .5,
          children: variantEntity.variantProducts
              .map((e) => ChoiceChip(
                    label: Text(e.value),
                    selected: selectedVariant.value == e.value,
                    onSelected: (value) {
                      changeVariant(e);
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
