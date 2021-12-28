import 'package:learning_app/l10n/localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productEntity}) : super(key: key);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultPadding * 10,
      width: defaultPadding * 7,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultPadding * .5),
          onTap: () {
            Get.toNamed(RouteList.productDetailsScreen,
                arguments: productEntity);
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding * .5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding * .5),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: productEntity.imageUrl!,
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/no_image.png",
                      ),
                    ),
                  ),
                ),
                defaultSpacerSmall,
                Text(
                  productEntity.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                defaultSpacerSmall,
                Text(
                  productEntity.price!.toString() +
                      " " +
                      AppLocalizations.of(context)!.currency,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
