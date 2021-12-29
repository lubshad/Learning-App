import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/screens/course_details_screen/components/price_ranges.dart';
import 'package:learning_app/presentation/screens/course_details_screen/components/variant_selection.dart';
import 'package:learning_app/presentation/theme/theme.dart';

import '../course_details_controller.dart';
import 'basic_details.dart';

class ProductDetailsSections extends StatelessWidget {
  const ProductDetailsSections({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          BasicDetails(courseDetails: courseDetails),
        ],
      )
    );
  }
}




  // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Flexible(
          //       child: Text(
          //         productDetailsController
          //             .selectedVariant.productEntity.name!,
          //         style: Theme.of(context).textTheme.headline6,
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 2,
          //       ),
          //     ),
          //     IconButton(
          //         color: primaryColor,
          //         iconSize: defaultPadding * 2,
          //         onPressed: productDetailsController.addProductToWishlist,
          //         icon: Icon(productDetailsController.isWishlistProduct
          //             ? Icons.favorite
          //             : Icons.favorite_outline))
          //   ],
          // ),
          // Text(
          //   productDetailsController.selectedVariant.productEntity.price!
          //           .toString() +
          //       " " +
          //       AppLocalizations.of(context)!.currency,
          //   style: Theme.of(context).textTheme.headline6BoldPrimary(),
          // ),
          // defaultSpacerSmall,
          // Text(
          //   AppLocalizations.of(context)!.mrp +
          //       " : " +
          //       productDetailsController.selectedVariant.productEntity.mrp!
          //           .toString() +
          //       " " +
          //       AppLocalizations.of(context)!.currency,
          //   style: Theme.of(context).textTheme.caption,
          // ),
          // defaultSpacer,
          // VariantSelection(
          //   changeVariant: productDetailsController.changeVariant,
          //   selectedVariant: productDetailsController.selectedVariant,
          //   variantEntity: productDetailsController.variantEntity,
          // ),
          // defaultSpacer,
          // PriceRanges(
          //     priceRanges:
          //         productDetailsController.selectedVariant.priceRanges)