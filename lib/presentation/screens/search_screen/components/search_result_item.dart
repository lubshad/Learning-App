import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: defaultPadding * .25, horizontal: defaultPadding * .5),
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        onTap: () => Get.toNamed(RouteList.productDetailsScreen,
            arguments: productEntity),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding * .5),
          child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: productEntity.imageUrl!,
                width: defaultPadding * 3,
                height: defaultPadding * 3,
              ),
              title: Text(productEntity.name!),
              subtitle: Text(
                productEntity.price!.toString() +
                    " " +
                    AppLocalizations.of(context)!.currency,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: IconButton(
                  color: primaryColor,
                  iconSize: defaultPadding * 1.5,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline))),
        ),
      ),
    );
  }
}
