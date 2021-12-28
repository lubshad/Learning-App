import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.items,
            style: Theme.of(context).textTheme.headline6,
          ),
          defaultSpacerSmall,
          ...List.generate(
              products.length,
              (index) => Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultPadding * .25),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultPadding * .5)),
                      onTap: () => Get.toNamed(RouteList.productDetailsScreen,
                          arguments: products[index]),
                      leading: CachedNetworkImage(
                        imageUrl: products[index].imageUrl!,
                        width: defaultPadding * 3,
                        height: defaultPadding * 3,
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/no_image.png",
                        ),
                      ),
                      title: Text(
                        products[index].name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "${products[index].qty!} X ${products[index].price}"),
                      trailing: Text(products[index].total! +
                          " " +
                          AppLocalizations.of(context)!.currency),
                    ),
                  ))
        ],
      ),
    );
  }
}
