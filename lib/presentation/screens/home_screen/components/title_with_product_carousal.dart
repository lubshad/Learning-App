import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';
import 'package:learning_app/presentation/widgets/product_card.dart';

class TitleWithCourceCarousal extends StatelessWidget {
  const TitleWithCourceCarousal({
    Key? key,
    required this.titleWithCourcesEntity,
  }) : super(key: key);

  final TitleWithCourcesEntity titleWithCourcesEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWithPadding(text: titleWithCourcesEntity.title),
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                titleWithCourcesEntity.cources.length,
                (index) => CourceCard(
                  cource: titleWithCourcesEntity.cources[index],
                ),
              ),
            ],
          ),
        ),
        defaultSpacer,
      ],
    );
  }
}
