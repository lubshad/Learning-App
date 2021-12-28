import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreenController extends ChangeNotifier {
  Screens currentScreen = Screens.home;

  changeScreen(int index) {
    currentScreen = Screens.values[index];
    notifyListeners();
  }

  // changelocale() async {
  //   final user = Get.find<AuthController>().user;
  //   if (user != null) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     Get.find<ChangeLocale>()(Locale(user.locale));
  //   }
  // }
}
