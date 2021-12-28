import 'package:flutter/cupertino.dart';
import 'package:learning_app/utils/debug_utils.dart';

class ChangePasswordController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>(debugLabel: "change-password-key");
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  clear() {
    currentPasswordController.text = "";
    newPasswordController.text = "";
    confirmPasswordController.text = "";
    buttonLoading = false;
    passwordVisible = false;
    newPasswordVisible = false;
    confirmPasswordVisible = false;
  }

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  changePassword() async {
    consoleLog("change password");
    makeButtonLoading();
    if (formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 3));
    }
    makeButtonNotLoading();
  }

  bool passwordVisible = false;
  changePasswordVissibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  bool newPasswordVisible = false;
  changeNewPasswordVissibility() {
    newPasswordVisible = !newPasswordVisible;
    notifyListeners();
  }

  bool confirmPasswordVisible = false;
  changeConfirmPasswordVissibility() {
    confirmPasswordVisible = !confirmPasswordVisible;
    notifyListeners();
  }
}
