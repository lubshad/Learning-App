import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:learning_app/presentation/widgets/default_page_transition.dart';

import 'navigation_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationScreenController navigationScreenController = Get.find();
    navigationScreenController.changeScreen(Screens.home.index);
    return AnimatedBuilder(
      animation: navigationScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: DefaultPageTransition(
            child: screens[navigationScreenController.currentScreen.index],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // icon: SvgPicture.asset(
                //   'assets/svgs/ic_menu.svg',
                //   width: defaultPadding,
                //   height: defaultPadding,
                //   color: navigationScreenController.currentScreen.index == 0
                //       ? primaryColor
                //       : greyColor,
                // ),
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.play_lesson_outlined),
                // icon: SvgPicture.asset(
                //   'assets/svgs/ic_search.svg',
                //   width: defaultPadding,
                //   height: defaultPadding,
                //   color: navigationScreenController.currentScreen.index == 1
                //       ? primaryColor
                //       : greyColor,
                // ),

                label: AppLocalizations.of(context)!.course,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.text_snippet_outlined),
                // icon: SvgPicture.asset(
                //   'assets/svgs/ic_search.svg',
                //   width: defaultPadding,
                //   height: defaultPadding,
                //   color: navigationScreenController.currentScreen.index == 1
                //       ? primaryColor
                //       : greyColor,
                // ),

                label: AppLocalizations.of(context)!.exam,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                // icon: SvgPicture.asset(
                //   'assets/svgs/ic_cart.svg',
                //   width: defaultPadding,
                //   height: defaultPadding,
                //   color: navigationScreenController.currentScreen.index == 3
                //       ? primaryColor
                //       : greyColor,
                // ),

                label: AppLocalizations.of(context)!.cart,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                // icon: SvgPicture.asset(
                //   'assets/svgs/ic_profile.svg',
                //   width: defaultPadding,
                //   height: defaultPadding,
                //   color: navigationScreenController.currentScreen.index == 2
                //       ? primaryColor
                //       : greyColor,
                // ),

                label: AppLocalizations.of(context)!.account,
              ),
            ],
            currentIndex: navigationScreenController.currentScreen.index,
            onTap: (index) {
              navigationScreenController.changeScreen(index);
            },
          ),
        );
      },
    );
  }
}