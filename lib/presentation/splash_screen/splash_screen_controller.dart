import 'dart:io';

import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/version_check.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/url_launcher_services.dart';

class SplashScreenController extends ChangeNotifier {
  bool isLoading = true;

  bool forceUpdate = false;
  VersionCheck versionCheck = Get.find();

  AppError? appError;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  // VersionCheck versionCheck = Get.find();

  pushAuthWrapper() {
    Get.offAllNamed(RouteList.initial);
  }

  updateLater() {
    pushAuthWrapper();
  }

  updateNow() {
    UrlLauncherServices.launchInBrowser(Platform.isAndroid
        ? ApiConstants.playStoreUrl
        : ApiConstants.appStoreUrl);
  }

  checkVersion() async {
    makeLoading();
    final response = await versionCheck(NoParams());
    response.fold((l) => l.handleError(), (r) async {
      if (r["status"] == 1) {
        pushAuthWrapper();
      }
      if (r["status"] == 0) {
        if (r["force_update"] == 1) {
          forceUpdate = true;
        }
        makeNotLoading();
      }
    });
  }
}
