import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/custom_slider_home_page.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';

import 'components/title_with_product_carousal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    homeScreenController.getData();
    return AnimatedBuilder(
      animation: homeScreenController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: homeScreenController.appError,
          loading: homeScreenController.isLoading,
          retry: homeScreenController.getData,
          child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: bgLightBlue,
            //   title: Row(
            //     children: [
            //       Image.asset(
            //         "assets/logo_only.png",
            //         width: 40,
            //         fit: BoxFit.contain,
            //       ),
            //       defaultSpacerHorizontalSmall,
            //       Image.asset(
            //         "assets/name.png",
            //         height: 40,
            //         fit: BoxFit.contain,
            //       ),
            //     ],
            //   ),
            //   actions: [
            //     TextButton(
            //         onPressed: homeScreenController.changeLocale,
            //         child: Text(AppLocalizations.of(context)!.locale))
            //   ],
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCarouselHomePage(
                    items: homeScreenController.bannerItems,
                  ),
                  defaultSpacer,
                  defaultSpacer,
                  // HomeCategories(
                  //   categories: homeScreenController.categories,
                  // ),
                  ...List.generate(
                      homeScreenController.titleWithCourses.length,
                      (index) => TitleWithCourseCarousal(
                            titleWithCoursesEntity:
                                homeScreenController.titleWithCourses[index],
                          ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
