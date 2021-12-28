import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/presentation/screens/product_details_screen/product_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/custom_slider_product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    Key? key,
    required this.productDetailsController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // automaticallyImplyLeading: false,
      leadingWidth: defaultPadding * 2,
      pinned: true,
      backgroundColor: whiteColor,
      elevation: defaultPadding * .25,
      expandedHeight: MediaQuery.of(context).size.height * .4,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double height = constraints.biggest.height;
          bool collapsed = height < 100;
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2, vertical: defaultPadding),
            title: collapsed
                ? Text(
                    productDetailsController
                        .selectedVariant.productEntity.name!,
                    style: const TextStyle(color: blackColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1)
                : const SizedBox.shrink(),
            // title: const Text("Amul Chocolate"),
            background: SafeArea(
                child: CustomCarouselProductDetails(
              items: productDetailsController.images
                  .map((e) => BannerEntity(image: e, onTap: () {}))
                  .toList(),
              alignment: Alignment.center,
              boxFit: BoxFit.cover,
            )),
          );
        },
      ),
    );
  }
}
