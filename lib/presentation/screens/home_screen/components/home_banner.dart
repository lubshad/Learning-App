import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final BannerEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding),
          child: CachedNetworkImage(
            imageUrl: item.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Image.asset(
              "assets/no_image.png",
            ),
          ),
        ),
      ),
    );
  }
}
