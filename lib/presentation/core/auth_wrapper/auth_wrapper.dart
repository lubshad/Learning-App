import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/core/navigation_screen/navigation_screen.dart';
import 'package:learning_app/presentation/screens/auth_screen/auth_screen.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_screen.dart';
import 'package:learning_app/presentation/screens/upload_kyc_screen/upload_kyc_screen.dart';
import 'package:learning_app/presentation/widgets/default_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return AnimatedBuilder(
      animation: authController,
      builder: (context, child) => DefaultPageTransition(
        child: authController.user != null
            ? const AuthScreen()
            // : const AddAddressScreen(),
            : const NavigationScreen(),
      ),
    );
  }

  Widget switchRegistrationStatus(RegistrationStatus registrationStatus) {
    switch (registrationStatus) {
      case RegistrationStatus.registered:
        return const UploadKycScreen();
      case RegistrationStatus.kycUploaded:
        return const MyAddressScreen();
      case RegistrationStatus.addressAdded:
        return const Scaffold();
      case RegistrationStatus.verified:
        return const NavigationScreen();
    }
  }
}
