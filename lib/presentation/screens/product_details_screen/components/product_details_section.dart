import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/product_details_screen/components/price_ranges.dart';
import 'package:learning_app/presentation/screens/product_details_screen/components/variant_selection.dart';
import 'package:learning_app/presentation/screens/product_details_screen/product_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductDetailsSections extends StatelessWidget {
  const ProductDetailsSections({
    Key? key,
    required this.productDetailsController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    productDetailsController
                        .selectedVariant.productEntity.name!,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                IconButton(
                    color: primaryColor,
                    iconSize: defaultPadding * 2,
                    onPressed: productDetailsController.addProductToWishlist,
                    icon: Icon(productDetailsController.isWishlistProduct
                        ? Icons.favorite
                        : Icons.favorite_outline))
              ],
            ),
            Text(
              productDetailsController.selectedVariant.productEntity.price!
                      .toString() +
                  " " +
                  AppLocalizations.of(context)!.currency,
              style: Theme.of(context).textTheme.headline6BoldPrimary(),
            ),
            defaultSpacerSmall,
            Text(
              AppLocalizations.of(context)!.mrp +
                  " : " +
                  productDetailsController.selectedVariant.productEntity.mrp!
                      .toString() +
                  " " +
                  AppLocalizations.of(context)!.currency,
              style: Theme.of(context).textTheme.caption,
            ),
            defaultSpacer,
            VariantSelection(
              changeVariant: productDetailsController.changeVariant,
              selectedVariant: productDetailsController.selectedVariant,
              variantEntity: productDetailsController.variantEntity,
            ),
            defaultSpacer,
            PriceRanges(
                priceRanges:
                    productDetailsController.selectedVariant.priceRanges)
          ],
        ),
      ),
    );
  }
}
