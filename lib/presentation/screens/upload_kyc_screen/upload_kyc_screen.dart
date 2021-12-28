import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/upload_kyc_screen/upload_kyc_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/bold_headline_5.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/licence_image_with_date.dart';
import 'package:learning_app/presentation/widgets/whole_loading_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UploadKycScreen extends StatelessWidget {
  const UploadKycScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UploadKycController uploadKycController = Get.find();
    return AnimatedBuilder(
      animation: uploadKycController,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: bgLightBlue,
                  // title: Text(AppLocalizations.of(context)!.upload_kyc_details),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldHeadline5(
                            text: AppLocalizations.of(context)!
                                .upload_kyc_details),
                        defaultSpacer,
                        LicenseImageWithDate(
                          networkImages: const [],
                          removeImage:
                              uploadKycController.removeTradingLicenseImage,
                          addMoreImage:
                              uploadKycController.addTradingLicenseImage,
                          changeDate: () => uploadKycController
                              .changeTradingLicenseExpiry(context),
                          expiryDate: uploadKycController
                                      .tradingLicenseExpiry ==
                                  null
                              ? AppLocalizations.of(context)!.select_date
                              : DateFormat("dd/MM/yyyy").format(
                                  uploadKycController.tradingLicenseExpiry!),
                          images: uploadKycController.tradingLicenseImages,
                          text: AppLocalizations.of(context)!.trading_license,
                        ),
                        defaultSpacer,
                        LicenseImageWithDate(
                            networkImages: const [],
                            removeImage:
                                uploadKycController.removeVatCertificateImage,
                            text: AppLocalizations.of(context)!.vat_certificate,
                            expiryDate: uploadKycController
                                        .vatCertificateExpiry ==
                                    null
                                ? AppLocalizations.of(context)!.select_date
                                : DateFormat("dd/MM/yyyy").format(
                                    uploadKycController.vatCertificateExpiry!),
                            images: uploadKycController.vatCertificateImages,
                            addMoreImage:
                                uploadKycController.addVatCertificateImage,
                            changeDate: () => uploadKycController
                                .changeVatCertificateExpiry(context))
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    boxShadow: defaultShadow,
                    color: whiteColor,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(defaultPadding * .5),
                      child: DefaultButton(
                          text: AppLocalizations.of(context)!.submit,
                          onPressed: () =>
                              uploadKycController.submitKYC(context),
                          isLoading: uploadKycController.buttonLoading)),
                )),
            if (uploadKycController.buttonLoading)
              const LoadingIndicatorWithText()
          ],
        );
      },
    );
  }
}
