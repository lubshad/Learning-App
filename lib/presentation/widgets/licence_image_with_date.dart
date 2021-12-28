import 'dart:io';

import 'package:learning_app/l10n/localization.dart';
import 'package:flutter/material.dart';

import 'image_selection_widget.dart';

class LicenseImageWithDate extends StatelessWidget {
  const LicenseImageWithDate({
    Key? key,
    required this.text,
    required this.expiryDate,
    required this.images,
    this.addMoreImage,
    required this.changeDate,
    required this.removeImage,
    required this.networkImages,
    this.enabled = true,
  }) : super(key: key);

  final String text;
  final String expiryDate;
  final List<File> images;
  final VoidCallback? addMoreImage;
  final VoidCallback changeDate;
  final Function(int) removeImage;
  final List<String> networkImages;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSelection(
          title: text,
          addMoreImage: images.isEmpty ? addMoreImage : null,
          images: images,
          removeImage: removeImage,
          networkImages: networkImages,
        ),
        TextFormField(
          readOnly: true,
          enabled: enabled,
          keyboardType: TextInputType.datetime,
          onTap: changeDate,
          controller: TextEditingController(text: expiryDate),
          decoration: InputDecoration(
              label: Text(text + " " + AppLocalizations.of(context)!.expiry)),
        )
      ],
    );
  }
}
