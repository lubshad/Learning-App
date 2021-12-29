import 'package:flutter/material.dart';
import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';

import '../course_details_controller.dart';
import 'trailer.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    Key? key,
    required this.productDetailsController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: defaultPadding * 2,
      pinned: true,
      backgroundColor: whiteColor,
      elevation: defaultPadding * .25,
      expandedHeight: MediaQuery.of(context).size.width * .5,
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
                        .productDetailsResponseModel!.data.title,
                    style: const TextStyle(color: blackColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1)
                : const SizedBox.shrink(),
            background: Trailer(
              trailerUrl: ApiConstants.defaultWebUrl +
                  productDetailsController
                      .productDetailsResponseModel!.data.teaserVideo,
            ),
          );
        },
      ),
    );
  }
}
