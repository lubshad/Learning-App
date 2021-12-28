import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/gradiant_icon_button.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradiantIconButton(
        child: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
        onPressed: Get.back,
        size: defaultPadding * 2,
      ),
    );
  }
}
