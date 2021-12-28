import 'dart:io';

import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/domain/params/add_address_params.dart';
import 'package:learning_app/domain/params/upload_kyc_params.dart';
import 'package:learning_app/domain/usecases/upload_kyc.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/utils/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class UploadKycController extends ChangeNotifier {
  List<File> tradingLicenseImages = [];
  List<File> vatCertificateImages = [];

  DateTime? tradingLicenseExpiry;
  DateTime? vatCertificateExpiry;

  UserEntity userEntity = Get.arguments;

  UploadKyc uploadKyc = Get.find();

  submitKYC(BuildContext context) async {
    if (validate(context)) {
      makeButtonLoading();
      bool tradingLicenseUploaded = await uploadTradingLicense();
      if (tradingLicenseUploaded) {
        bool vatCertificateUploaded = await uploadVATcertificate();
        if (vatCertificateUploaded) {
          Get.toNamed(RouteList.addAddressScreen,
              arguments: AddAddressArguments(
                  addAddressType: AddAddressType.registration,
                  user: userEntity));
        }
      }
    }
    makeButtonNotLoading();
  }

  Future<bool> uploadTradingLicense() async {
    bool result = false;
    UploadKycParams uploadKycParams = UploadKycParams(
      sessionId: userEntity.sessionId,
      userId: userEntity.userId,
      expDate: tradingLicenseExpiry,
      images: {"kyc_img": tradingLicenseImages[0]},
      kycType: KYCType.tradingLicense,
    );
    final response = await uploadKyc(uploadKycParams);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"] == 1) {
        result = true;
      }
    });
    return result;
  }

  Future<bool> uploadVATcertificate() async {
    bool result = false;
    UploadKycParams uploadKycParams = UploadKycParams(
      sessionId: userEntity.sessionId,
      userId: userEntity.userId,
      expDate: vatCertificateExpiry,
      images: {"kyc_img": vatCertificateImages[0]},
      kycType: KYCType.vatCertificate,
    );
    final response = await uploadKyc(uploadKycParams);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"] == 1) {
        result = true;
      }
    });
    return result;
  }

  bool validate(BuildContext context) {
    bool valid = false;
    if (tradingLicenseImages.isEmpty) {
      showMessage(
          AppLocalizations.of(context)!.please_upload_trading_licence_image);
    } else if (vatCertificateImages.isEmpty) {
      showMessage(
          AppLocalizations.of(context)!.please_upload_vat_certificate_image);
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
