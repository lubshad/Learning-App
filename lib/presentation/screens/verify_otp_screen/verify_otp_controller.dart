import 'dart:async';

import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/domain/params/add_address_params.dart';
import 'package:learning_app/domain/params/auth_params.dart';
import 'package:learning_app/domain/params/verify_otp_args.dart';
import 'package:learning_app/domain/usecases/resend_otp.dart';
import 'package:learning_app/domain/usecases/verify_otp_login.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class VerifyOtpController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>(debugLabel: 'verify_otp_form_key');
  final otpController = TextEditingController();

  VerifyOtpLogin verifyOtpLogin = Get.find();
  ResendOtp resendOtp = Get.find();

  VerifyOtpArgs verifyOtpArgs = Get.arguments;

  Duration remainingTime = const Duration(minutes: 2);

  VerifyOtpController() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > const Duration(seconds: 0)) {
        remainingTime = remainingTime - const Duration(seconds: 1);
      }
      notifyListeners();
    });
  }

  verifyOtp() async {
    if (validate()) {
      makeButtonLoading();
      AuthParams authParams =
          AuthParams(phone: verifyOtpArgs.phoneNumber, otp: otpController.text);
      if (verifyOtpArgs.otpVerificationType == OTPVerification.loginUser) {
        await verifyOtpUserLogin(authParams);
      }
      if (verifyOtpArgs.otpVerificationType == OTPVerification.createAccount) {
        await verifyOtpUserRegistration(authParams);
      }
    }
    makeButtonNotLoading();
  }

  Future<void> verifyOtpUserLogin(AuthParams authParams) async {
    final response = await verifyOtpLogin(authParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status == 1) {
        Get.until((route) => Get.currentRoute == RouteList.initial);
        UserEntity userEntity = r.data!;
        // switch (RegistrationStatus.values[userEntity.registrationStatus]) {
        //   case RegistrationStatus.registered:
        //     Get.toNamed(RouteList.uploadKycScreen, arguments: userEntity);
        //     break;
        //   case RegistrationStatus.kycUploaded:
        //     AddAddressArguments addAddressArguments = AddAddressArguments(
        //         addAddressType: AddAddressType.registration, user: userEntity);
        //     Get.toNamed(RouteList.addAddressScreen,
        //         arguments: addAddressArguments);
        //     break;
        //   case RegistrationStatus.addressAdded:
        //     Get.toNamed(RouteList.verificationPending);
        //     break;
        //   case RegistrationStatus.verified:
        //     break;
        // }
      } else {
        showMessage(r.message);
      }
    });
    return;
  }

  Future<void> verifyOtpUserRegistration(AuthParams authParams) async {
    final response = await verifyOtpLogin(authParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status == 1) {
        UserEntity userEntity = r.data!;
        Get.toNamed(RouteList.uploadKycScreen, arguments: userEntity);
      } else {
        showMessage(r.message);
      }
    });
    return;
  }

  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
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

  void resendOTP() async {
    VerifyOtpArgs verifyOtpArgs = Get.arguments;
    AuthParams authParams = AuthParams(phone: verifyOtpArgs.phoneNumber);
    final response = await resendOtp(authParams);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"] == 1) {
        showMessage(r["message"]);
        remainingTime = const Duration(minutes: 2);
        notifyListeners();
      }
    });
  }
}
