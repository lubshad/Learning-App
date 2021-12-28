import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({
    Key? key,
    required this.userEntity,
  }) : super(key: key);

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          child: CachedNetworkImage(
            imageUrl: userEntity.imageUrl,
            fit: BoxFit.cover,
            width: defaultPadding * 6,
            height: defaultPadding * 6,
            errorWidget: (context, url, error) => Image.asset(
              "assets/no_image.png",
            ),
          ),
        ),
        defaultSpacerHorizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userEntity.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            defaultSpacerSmall,
            Text(
              userEntity.phone,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        )
      ],
    );
  }
}
