import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/presentation/widgets/sorting_button.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:flutter/cupertino.dart';

class OffersProductsController extends ChangeNotifier {
  SortType selectedSortType = SortType.lowToHigh;

  List<ProductEntity> offersProducts = [];

  int offset = 0;
  bool isLoadingMore = false;
  bool moreItemsAvailable = true;
  makeNoMoreItems() {
    moreItemsAvailable = false;
    notifyListeners();
  }

  makeMoreItems() {
    moreItemsAvailable = true;
    notifyListeners();
  }

  makeLoadingMore() {
    isLoadingMore = true;
    notifyListeners();
  }

  makeNotLoadingMore() {
    isLoadingMore = false;
    notifyListeners();
  }

  loadMore() async {
    if (moreItemsAvailable && !isLoadingMore) {
      makeLoadingMore();
      offset++;
      consoleLog('Loading More');
      await Future.delayed(const Duration(seconds: 2));
      makeNotLoadingMore();
    }
  }

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

  retry() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  getData() async {
    offersProducts = [];
    offersProducts = offerProductList;
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  sortProducts(SortType sortType) {
    selectedSortType = sortType;
    notifyListeners();
  }
}

List<ProductEntity> offerProductList = const [
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
  ProductEntity(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      name: "Sweets Product",
      price: "22.00"),
];
