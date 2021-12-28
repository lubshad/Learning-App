import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class RemovableNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Function(String)? removeNetworkImage;

  const RemovableNetworkImage(
      {Key? key, this.imageUrl, this.removeNetworkImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OpenContainer(
          closedBuilder: (BuildContext context, void Function() action) {
            return SizedBox(
                height: defaultPadding * 10,
                width: defaultPadding * 10,
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (a, b, c) => const Icon(Icons.error),
                ));
          },
          openBuilder: (BuildContext context,
              void Function({Object returnValue}) action) {
            return Scaffold(
              body: PhotoView(
                imageProvider: CachedNetworkImageProvider(imageUrl!),
              ),
            );
          },
        ),
        if (removeNetworkImage != null)
          Positioned(
            right: 0,
            child: IconButton(
                onPressed: () => removeNetworkImage!(imageUrl!),
                icon: const Icon(Icons.remove_circle, color: Colors.red)),
          ),
      ],
    );
  }
}
