import 'package:learning_app/domain/params/temporary_unavailable_args.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/l10n/localization.dart';

class TemporaryUnAvailable extends StatelessWidget {
  const TemporaryUnAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TemporaryUnAvailableArgs temporaryUnAvailableArgs = Get.arguments;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: bgLightBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            temporaryUnAvailableArgs.imageUrl == null
                ? Image.asset("assets/ic_temporary_unavailable.png")
                : CachedNetworkImage(
                    imageUrl: temporaryUnAvailableArgs.imageUrl!),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: temporaryUnAvailableArgs.text == null
                  ? Text(AppLocalizations.of(context)!.temporary_unavailable)
                  : Text(temporaryUnAvailableArgs.text!),
            )
          ],
        ),
      ),
    );
  }
}
