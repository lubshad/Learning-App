import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    Key? key,
    required this.categoryEntity,
  }) : super(key: key);

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: defaultPadding * 5,
      height: defaultPadding * 5,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultPadding * .5),
          onTap: () {
            Get.toNamed(RouteList.categoryDetailsScreen,
                arguments: categoryEntity);
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding * .5),
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: categoryEntity.imageUrl,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
                Text(
                  categoryEntity.name,
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
