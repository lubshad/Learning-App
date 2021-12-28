import 'package:flutter/material.dart';
import 'package:learning_app/domain/params/auth_params.dart';
import 'package:learning_app/domain/params/verify_otp_args.dart';
import 'package:learning_app/domain/usecases/login_user.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class LoginScreenController extends ChangeNotifier {
  final phoneNumberController = TextEditingController();
  LoginUser loginUser = Get.find();

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  void sendOtp() async {
    makeButtonLoading();
    AuthParams authParams = AuthParams(phone: phoneNumberController.text);
    final response = await loginUser(authParams);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"] == 1) {
        VerifyOtpArgs verifyOtpArgs = VerifyOtpArgs(
            phoneNumberController.text, OTPVerification.loginUser);
        Get.toNamed(RouteList.verifyOtpScreen, arguments: verifyOtpArgs);
      } else {
        showMessage(r["message"]);
      }
    });
    makeButtonNotLoading();
  }

  final formKey = GlobalKey<FormState>(debugLabel: 'login_form_key');
  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }
}
