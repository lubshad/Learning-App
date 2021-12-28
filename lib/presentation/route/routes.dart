import 'package:learning_app/presentation/core/auth_wrapper/auth_wrapper.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/add_address_screen/add_address_screen.dart';
import 'package:learning_app/presentation/screens/category_details_screen/cateogory_details_screen.dart';
import 'package:learning_app/presentation/screens/checkout_screen/checkout_screen.dart';
import 'package:learning_app/presentation/screens/edit_address_screen/edit_address_screen.dart';
import 'package:learning_app/presentation/screens/filter_screen/filter_screen.dart';
import 'package:learning_app/presentation/screens/kyc_details_screen/kyc_details_screen.dart';
import 'package:learning_app/presentation/screens/login_screen/login_screen.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_screen.dart';
import 'package:learning_app/presentation/screens/my_order_details/my_order_details.dart';
import 'package:learning_app/presentation/screens/my_orders/my_orders.dart';
import 'package:learning_app/presentation/screens/offers_products/offers_products.dart';
import 'package:learning_app/presentation/screens/order_success_screen/order_success_screen.dart';
import 'package:learning_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:learning_app/presentation/screens/register_screen/register_screen.dart';
import 'package:learning_app/presentation/screens/registration_success_screen/registration_success_screen.dart';
import 'package:learning_app/presentation/screens/temporary_unawailable_screen/temporary_unavailable.dart';
import 'package:learning_app/presentation/screens/upload_kyc_screen/upload_kyc_screen.dart';
import 'package:learning_app/presentation/screens/verification_pending/verification_pending.dart';
import 'package:learning_app/presentation/screens/verify_otp_screen/verify_otp_screen.dart';
import 'package:learning_app/presentation/screens/web_view/web_view.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/wishlist_screen.dart';
import 'package:learning_app/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const AuthWrapper(),
        RouteList.authWrapper: const AuthWrapper(),
        RouteList.register: const RegisterScreen(),
        RouteList.login: const LoginScreen(),
        RouteList.myOrders: const MyOrders(),
        RouteList.myOrderDetails: const MyOrderDetails(),
        RouteList.checkout: const Checkout(),
        RouteList.wishList: const WishList(),
        RouteList.verifyOtpScreen: const VerifyOtpScreen(),
        RouteList.uploadKycScreen: const UploadKycScreen(),
        RouteList.kycDetailsScreen: const KycDetailsScreen(),
        RouteList.addAddressScreen: const AddAddressScreen(),
        RouteList.editAddressScreen: const EditAddressScreen(),
        RouteList.myAddressScreen: const MyAddressScreen(),
        RouteList.registrationSuccessScreen: const RegistrationSuccessScreen(),
        RouteList.verificationPending: const VerificationPendingScreen(),
        RouteList.categoryDetailsScreen: const CategoryDetailsScreen(),
        RouteList.productDetailsScreen: const ProductDetailsScreen(),
        RouteList.filterScreen: const FilterScreen(),
        RouteList.offersProducts: const OffersProducts(),
        RouteList.orderSuccess: const OrderSuccesssScreen(),
        RouteList.splashScreen: const SplashScreen(),
        RouteList.temporaryUnAvailable: const TemporaryUnAvailable(),
        RouteList.webView: const DefaultWebView(),
      };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}
