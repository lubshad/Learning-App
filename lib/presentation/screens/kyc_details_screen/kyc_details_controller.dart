import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/kyc_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/params/upload_kyc_params.dart';
import 'package:learning_app/domain/usecases/get_kyc_details.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:learning_app/utils/image_picker_service.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class KycDetailsController extends ChangeNotifier {
  List<File> tradingLicenseImages = [];
  List<File> vatCertificateImages = [];

  List<String> tradingLicenseNetworkImages = [];
  List<String> vatCertificateNetworkImages = [];

  late KycDetailsResponseModel kycDetailsResponseModel;
  AuthController authController = Get.find();

  DateTime? tradingLicenseExpiry;
  DateTime? vatCertificateExpiry;

  GetKYCDetails getKYCDetails = Get.find();

  KycDetailsController() {
    getData();
  }

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    appError = null;
    makeLoading();
    getData();
  }

  getData() async {
    consoleLog("data");
    final response = await getKYCDetails(NoParams());
    response.fold((l) => appError = l, (r) {
      setData(r);
    });
    makeNotLoading();
  }

  setData(KycDetailsResponseModel dataModel) {
    tradingLicenseNetworkImages.add(dataModel.data!.tradingLicense.img);
    vatCertificateNetworkImages.add(dataModel.data!.vatLicense.img);
    tradingLicenseExpiry = dataModel.data!.tradingLicense.expDate;
    vatCertificateExpiry = dataModel.data!.vatLicense.expDate;
  }

  submitKYC(BuildContext context) async {
    if (validate(context)) {
      makeButtonLoading();
      UploadKycParams uploadKycParams = UploadKycParams(
        sessionId: authController.user!.sessionId,
        userId: authController.user!.userId,
        expDate: tradingLicenseExpiry!,
        images: {"kyc_img": tradingLicenseImages[0]},
        kycType: KYCType.tradingLicense,
      );
      consoleLog(uploadKycParams);
      await Future.delayed(const Duration(seconds: 2));
      makeButtonNotLoading();
      Get.toNamed(RouteList.addAddressScreen);
    }
  }

  bool validate(BuildContext context) {
    bool valid = false;
    if (tradingLicenseImages.isEmpty) {
      showMessage(
          AppLocalizations.of(context)!.please_upload_trading_licence_image);
    } else if (tradingLicenseExpiry == null) {
      showMessage(
          AppLocalizations.of(context)!.please_add_trading_license_expiry_date);
    } else if (vatCertificateImages.isEmpty) {
      showMessage(
          AppLocalizations.of(context)!.please_upload_vat_certificate_image);
    } else if (vatCertificateExpiry == null) {
      showMessage(
          AppLocalizations.of(context)!.please_add_trading_license_expiry_date);
    } else {
      valid = true;
    }
    return valid;
  }

  changeTradingLicenseExpiry(BuildContext context) async {
    final currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: currentDate.add(const Duration(days: 90)));
    if (pickedDate != null) {
      tradingLicenseExpiry = pickedDate;
      notifyListeners();
    }
  }

  changeVatCertificateExpiry(BuildContext context) async {
    final currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: currentDate.add(const Duration(days: 90)));
    if (pickedDate != null) {
      vatCertificateExpiry = pickedDate;
      notifyListeners();
    }
  }

  addTradingLicenseImage() async {
    final file = await ImagePickerService.imagePickerType();
    if (file != null) {
      tradingLicenseImages.add(file);
      notifyListeners();
    }
  }

  removeTradingLicenseImage(int index) {
    tradingLicenseImages.removeAt(index);
    notifyListeners();
  }

  removeVatCertificateImage(int index) {
    vatCertificateImages.removeAt(index);
    notifyListeners();
  }

  addVatCertificateImage() async {
    final file = await ImagePickerService.imagePickerType();
    if (file != null) {
      vatCertificateImages.add(file);
      notifyListeners();
    }
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
}
