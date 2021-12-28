import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/region_list_response_model.dart';
import 'package:learning_app/domain/entities/platform.dart';
import 'package:learning_app/domain/entities/region_entity.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/params/registration_params.dart';
import 'package:learning_app/domain/params/verify_otp_args.dart';
import 'package:learning_app/domain/usecases/create_account.dart';
import 'package:learning_app/domain/usecases/get_regions.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/utils/firebase_messaging.dart';
import 'package:learning_app/utils/image_picker_service.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class RegisterScreenController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>(debugLabel: 'register_form_key');
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  GetRegions getRegions = Get.find();

  RegionEntity? selectedRegion;

  changeSelectedRegion(RegionEntity? region) {
    selectedRegion = region;
    notifyListeners();
  }

  List<DropdownMenuItem<RegionEntity>> get regionDropdownItems => regions
      .map((e) =>
          DropdownMenuItem<RegionEntity>(value: e, child: Text(e.regionName)))
      .toList();

  getAllRegions() async {
    final response = await getRegions(NoParams());
    response.fold((l) => l.handleError(), (r) {
      if (r.status == 1) {
        setData(r);
      }
    });
  }

  List<RegionEntity> regions = [];

  CreateAccount createAccount = Get.find();

  List<File> shopImages = [];

  bool validate(BuildContext context) {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      if (shopImages.isEmpty) {
        showMessage(AppLocalizations.of(context)!.please_upload_shop_image);
      } else if (!agreeToTerms) {
        showMessage(
            AppLocalizations.of(context)!.agree_to_the_terms_and_conditions);
      } else {
        valid = true;
      }
    }
    return valid;
  }

  sendOtp(BuildContext context) async {
    if (validate(context)) {
      makeButtonLoading();
      final fcmToken = await getToken();
      final devicePlatform =
          Platform.isAndroid ? DevicePlatform.android : DevicePlatform.ios;
      RegistrationParams registrationParams = RegistrationParams(
        regionId: selectedRegion!.id,
        fcm: fcmToken,
        name: nameController.text,
        phoneNumber: phoneController.text,
        images: {"shop_image": shopImages[0]},
        platform: devicePlatform,
      );
      final response = await createAccount(registrationParams);
      response.fold((l) => l.handleError(), (r) {
        if (r["status"] == 1) {
          VerifyOtpArgs verifyOtpArgs = VerifyOtpArgs(
              phoneController.text, OTPVerification.createAccount);
          Get.toNamed(RouteList.verifyOtpScreen, arguments: verifyOtpArgs);
        } else {
          showMessage(r["message"]);
        }
      });
    }
    makeButtonNotLoading();
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

  bool agreeToTerms = false;
  makeAgreedToTerms() {
    agreeToTerms = true;
    notifyListeners();
  }

  makeNotAgreeToTerms() {
    agreeToTerms = false;
    notifyListeners();
  }

  void tougleTermsAndCondition() {
    agreeToTerms ? makeNotAgreeToTerms() : makeAgreedToTerms();
  }

  void addShopImage() async {
    final file = await ImagePickerService.imagePickerType();
    if (file != null) {
      shopImages.add(file);
      notifyListeners();
    }
  }

  removeShopImage(int index) {
    shopImages.removeAt(index);
    notifyListeners();
  }

  void setData(RegionListResponseModel r) {
    regions = r.data!.regions;
    notifyListeners();
  }

  String? validateRegionSelection(RegionEntity? value) {
    return value == null
        ? AppLocalizations.of(Get.context!)!.please_select_your_region
        : null;
  }
}
