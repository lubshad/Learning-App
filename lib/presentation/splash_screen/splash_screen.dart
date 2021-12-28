import 'package:learning_app/presentation/splash_screen/components/update_available.dart';
import 'package:learning_app/presentation/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController =
        Get.put(SplashScreenController());
    splashScreenController.checkVersion();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: AnimatedBuilder(
          animation: splashScreenController,
          builder: (BuildContext context, Widget? child) {
            bool isLoading = splashScreenController.isLoading;
            bool forceUpdate = splashScreenController.forceUpdate;
            return isLoading
                ? const Splash()
                : UpdateAvailable(
                    forceUpdate: forceUpdate,
                    updateLater: splashScreenController.updateLater,
                    updateNow: splashScreenController.updateNow,
                  );
          },
        ),
      ),
    );
  }
}
