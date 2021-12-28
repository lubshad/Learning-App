import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/change_locale.dart';
import 'package:learning_app/domain/usecases/get_home_data.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:learning_app/utils/firebase_messaging.dart';

class HomeScreenController extends ChangeNotifier {
  List<CategoryEntity> categories = [];
  List<TitleWithCoursesEntity> titleWithCourses = [];
  List<BannerEntity> bannerItems = [];

  GetHomeData getHomeData = Get.find();

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

  getData() async {
    appError = null;
    final response = await getHomeData(NoParams());
    response.fold((l) {
      appError = l;
    }, (r) {
      if (r.statusCode == 200) {
        setData(r);
        // subscribeToAllCategories();
      }
      //  else if (r.statusCode == 2) {
      //   pushToNotAvailableScreen(r);
      // }
    });
    makeNotLoading();
  }

  setData(HomeResponseModel dataModel) {
    bannerItems.clear();
    bannerItems.add(dataModel.banner);
    // categories = dataModel.data!.categories!;
    titleWithCourses = dataModel.horizontalSlider
        .where((element) => element != null)
        .map((e) => TitleWithCoursesEntity(
              title: e!.title,
              cources: e.data,
            ))
        .toList();
  }

  pushToNotAvailableScreen(HomeResponseModel r) {
    // Get.offAllNamed(RouteList.temporaryUnAvailable,
    //     arguments: TemporaryUnAvailableArgs(
    //         imageUrl: r.notAvailableImageUrl, text: r.message));
  }

  void changeLocale() {
    final currentLocale = Get.locale;
    consoleLog(currentLocale);
    Get.find<ChangeLocale>()(currentLocale == const Locale("en")
        ? const Locale("ar")
        : const Locale("en"));
  }

  void subscribeToAllCategories() {
    for (var element in categories) {
      fcmSubscribe(topic: element.id);
    }
  }
}
