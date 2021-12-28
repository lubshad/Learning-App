import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/kyc_details_screen/kyc_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/licence_image_with_date.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KycDetailsScreen extends StatelessWidget {
  const KycDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KycDetailsController kycDetailsController = Get.find();
    return AnimatedBuilder(
      animation: kycDetailsController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: bgLightBlue,
              title: Text(AppLocalizations.of(context)!.kyc_details),
            ),
            body: NetworkResource(
              appError: kycDetailsController.appError,
              loading: kycDetailsController.isLoading,
              retry: kycDetailsController.retry,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      LicenseImageWithDate(
                        enabled: false,
                        networkImages:
                            kycDetailsController.tradingLicenseNetworkImages,
                        removeImage:
                            kycDetailsController.removeTradingLicenseImage,
                        addMoreImage: null,
                        changeDate: () => kycDetailsController
                            .changeTradingLicenseExpiry(context),
                        expiryDate:
                            kycDetailsController.tradingLicenseExpiry == null
                                ? AppLocalizations.of(context)!.select_date
                                : DateFormat("dd/MM/yyyy").format(
                                    kycDetailsController.tradingLicenseExpiry!),
                        images: kycDetailsController.tradingLicenseImages,
                        text: AppLocalizations.of(context)!.trading_license,
                      ),
                      defaultSpacer,
                      LicenseImageWithDate(
                          enabled: false,
                          networkImages:
                              kycDetailsController.vatCertificateNetworkImages,
                          removeImage:
                              kycDetailsController.removeVatCertificateImage,
                          text: AppLocalizations.of(context)!.vat_certificate,
                          expiryDate: kycDetailsController
                                      .vatCertificateExpiry ==
                                  null
                              ? AppLocalizations.of(context)!.select_date
                              : DateFormat("dd/MM/yyyy").format(
                                  kycDetailsController.vatCertificateExpiry!),
                          images: kycDetailsController.vatCertificateImages,
                          addMoreImage: null,
                          changeDate: () => kycDetailsController
                              .changeVatCertificateExpiry(context))
                    ],
                  ),
                ),
              ),
            ));
        // bottomNavigationBar: Container(
        //   decoration: const BoxDecoration(
        //     boxShadow: defaultShadow,
        //     color: whiteColor,
        //   ),
        //   child: Padding(
        //       padding: const EdgeInsets.all(defaultPadding * .5),
        //       child: DefaultButton(
        //           text: AppLocalizations.of(context)!.submit,
        //           onPressed: () => kycDetailsController.submitKYC(context),
        //           isLoading: kycDetailsController.buttonLoading)),
        // ));
      },
    );
  }
}
