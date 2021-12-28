import 'dart:io';

import 'package:get/get.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/utils/debug_utils.dart';

class ImagePickerService {
  static Future<File?> imagePickerType() async {
    final response = await Get.defaultDialog<Future<File?>>(
      title: "Pick Image From",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () {
                    Get.back(result: pickImage(isGallery: false));
                  }),
              const Text("Camera")
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: const Icon(Icons.image_search_sharp),
                  onPressed: () {
                    Get.back(result: pickImage(isGallery: true));
                  }),
              const Text("Gallery")
            ],
          ),
        ],
      ),
    );
    return response;
  }

  static Future<File?> pickImage({
    bool isGallery = kDebugMode ? true : false,
    bool crop = true,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker()
        .pickImage(source: source, maxHeight: 1800, imageQuality: 50);

    if (pickedFile == null) return null;

    if (crop == false) {
      consoleLog(File(pickedFile.path).lengthSync());
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
      consoleLog(file.lengthSync());
      final croppedImage = await cropCustomImage(file);
      if (croppedImage != null) {
        consoleLog("cropped ${croppedImage.lengthSync()}");
      }
      return croppedImage ?? file;
    }
  }

  static Future<File?> cropCustomImage(File imageFile) async =>
      await ImageCropper.cropImage(
        // aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4),
        sourcePath: imageFile.path,
        androidUiSettings: androidUiSettings(),
        iosUiSettings: iosUiSettings(),
      );

  static IOSUiSettings iosUiSettings() => const IOSUiSettings(
        aspectRatioLockEnabled: false,
      );

  static AndroidUiSettings androidUiSettings() => const AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: primaryColor,
        toolbarWidgetColor: Colors.white,
        lockAspectRatio: false,
      );
}
