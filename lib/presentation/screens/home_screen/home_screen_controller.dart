import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/params/temporary_unavailable_args.dart';
import 'package:learning_app/domain/usecases/change_locale.dart';
import 'package:learning_app/domain/usecases/get_home_data.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:learning_app/utils/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends ChangeNotifier {
  List<CategoryEntity> categories = [];
  List<TitleWithProductsEntity> titleWithProducts = [];
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
      if (r.status == 1) {
        setData(r);
        subscribeToAllCategories();
      } else if (r.status == 2) {
        pushToNotAvailableScreen(r);
      }
    });
    makeNotLoading();
  }

  setData(HomeResponseModel dataModel) {
    bannerItems = dataModel.data!.banners!
        .map((e) => BannerEntity(
            image: e.bannerImage!, onTap: () => handlePayload(e.bannerLink!)))
        .toList();
    categories = dataModel.data!.categories!;
    titleWithProducts = dataModel.data!.products!;
  }

  pushToNotAvailableScreen(HomeResponseModel r) {
    Get.offAllNamed(RouteList.temporaryUnAvailable,
        arguments: TemporaryUnAvailableArgs(
            imageUrl: r.notAvailableImageUrl, text: r.message));
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
