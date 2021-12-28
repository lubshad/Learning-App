import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_app/presentation/screens/search_screen/components/custom_search_deligate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:learning_app/presentation/screens/search_screen/search_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learning_app/utils/debug_utils.dart';

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
                icon: SvgPicture.asset(
                  'assets/svgs/ic_menu.svg',
                  width: defaultPadding,
                  height: defaultPadding,
                  color: navigationScreenController.currentScreen.index == 0
                      ? primaryColor
                      : greyColor,
                ),
                // icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                // icon: const Icon(Icons.search),
                icon: SvgPicture.asset(
                  'assets/svgs/ic_search.svg',
                  width: defaultPadding,
                  height: defaultPadding,
                  color: navigationScreenController.currentScreen.index == 1
                      ? primaryColor
                      : greyColor,
                ),

                label: AppLocalizations.of(context)!.search,
              ),
              BottomNavigationBarItem(
                // icon: const Icon(Icons.person_outline),
                icon: SvgPicture.asset(
                  'assets/svgs/ic_profile.svg',
                  width: defaultPadding,
                  height: defaultPadding,
                  color: navigationScreenController.currentScreen.index == 2
                      ? primaryColor
                      : greyColor,
                ),

                label: AppLocalizations.of(context)!.profile,
              ),
              BottomNavigationBarItem(
                // icon: const Icon(Icons.shopping_cart_outlined),
                icon: SvgPicture.asset(
                  'assets/svgs/ic_cart.svg',
                  width: defaultPadding,
                  height: defaultPadding,
                  color: navigationScreenController.currentScreen.index == 3
                      ? primaryColor
                      : greyColor,
                ),

                label: AppLocalizations.of(context)!.cart,
              ),
            ],
            currentIndex: navigationScreenController.currentScreen.index,
            onTap: (index) {
              consoleLog(index);
              if (index == Screens.search.index) {
                Get.find<SearchController>().filters = [];
                showSearch(context: context, delegate: CustomSearchDeligate());
              } else {
                navigationScreenController.changeScreen(index);
              }
            },
          ),
        );
      },
    );
  }
}
