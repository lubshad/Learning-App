import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/removable_file_image.dart';
import 'package:learning_app/presentation/widgets/removable_network_image.dart';

import 'outline_section_with_header.dart';

class ImageSelection extends StatelessWidget {
  const ImageSelection({
    Key? key,
    this.images,
    this.addMoreImage,
    this.removeImage,
    required this.title,
    this.networkImages,
    this.removeNetworkImage,
  }) : super(key: key);

  final List<File>? images;
  final List<String>? networkImages;
  final VoidCallback? addMoreImage;
  final Function(int)? removeImage;
  final Function(String)? removeNetworkImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlineSectionWithHeader(
        heading: title,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: defaultPadding,
          runSpacing: defaultPadding,
          children: [
            if (networkImages != null && networkImages!.isNotEmpty)
              ...List.generate(networkImages!.length, (index) {
                final imageUrl = networkImages![index];
                return RemovableNetworkImage(
                    imageUrl: imageUrl, removeNetworkImage: removeNetworkImage);
              }),
            if (images != null && images!.isNotEmpty)
              ...List.generate(images!.length, (index) {
                final imageFile = images![index];
                return RemovableFileImage(
                  image: imageFile,
                  index: index,
                  removeImage: removeImage,
                );
              }),
            if (addMoreImage != null)
              Card(
                child: SizedBox(
                  height: defaultPadding * 5,
                  width: defaultPadding * 5,
                  child: IconButton(
                      onPressed: addMoreImage,
                      icon: const Icon(Icons.photo_camera)),
                ),
              ),
          ],
        ));
  }
}
