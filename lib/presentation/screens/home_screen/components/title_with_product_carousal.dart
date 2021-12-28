import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';
import 'package:learning_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class TitleWithProductCarousal extends StatelessWidget {
  const TitleWithProductCarousal({
    Key? key,
    required this.titleWithProductsEntity,
  }) : super(key: key);

  final TitleWithProductsEntity titleWithProductsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWithPadding(text: titleWithProductsEntity.title),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              children: [
                ...List.generate(
                  titleWithProductsEntity.products.length,
                  (index) => ProductCard(
                    productEntity: titleWithProductsEntity.products[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
