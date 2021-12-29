import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_wrapper.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/course_details_screen/course_details_screen.dart';
import 'package:learning_app/presentation/screens/login_screen/login_screen.dart';
import 'package:learning_app/presentation/screens/register_screen/register_screen.dart';
import 'package:learning_app/presentation/screens/temporary_unawailable_screen/temporary_unavailable.dart';
import 'package:learning_app/presentation/screens/verify_otp_screen/verify_otp_screen.dart';
import 'package:learning_app/presentation/splash_screen/splash_screen.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const AuthWrapper(),
        RouteList.authWrapper: const AuthWrapper(),
        RouteList.courseDetailsScreen: const CourseDetailsScreen(),
        RouteList.register: const RegisterScreen(),
        RouteList.login: const LoginScreen(),
        RouteList.verifyOtpScreen: const VerifyOtpScreen(),
        // RouteList.offersProducts: const OffersProducts(),
        RouteList.splashScreen: const SplashScreen(),
        RouteList.temporaryUnAvailable: const TemporaryUnAvailable(),
      };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}


