import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';
import 'package:learning_app/presentation/widgets/cource_card.dart';

class TitleWithCourseCarousal extends StatelessWidget {
  const TitleWithCourseCarousal({
    Key? key,
    required this.titleWithCoursesEntity,
  }) : super(key: key);

  final TitleWithCoursesEntity titleWithCoursesEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWithPadding(text: titleWithCoursesEntity.title),
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                titleWithCoursesEntity.cources.length,
                (index) => CourseCard(
                  cource: titleWithCoursesEntity.cources[index],
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
