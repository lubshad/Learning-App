import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/product_list_response_model.dart';
import 'package:learning_app/data/models/sub_categories_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/category_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/product_listing_params.dart';
import 'package:learning_app/domain/usecases/get_all_products.dart';
import 'package:learning_app/domain/usecases/get_sub_categories.dart';
import 'package:learning_app/presentation/widgets/sorting_button.dart';
import 'package:learning_app/utils/debug_utils.dart';

class CategoryDetailsController extends ChangeNotifier {
  int selectedIndex = 0;
  SortType selectedSortType = SortType.lowToHigh;

  CategoryEntity categoryEntity = Get.arguments;

  ScrollController scrollController =
      ScrollController(debugLabel: "category_product_grid_view");

  double scrollPosition = 0.0;

  List<CategoryEntity> subCategories = [
    const CategoryEntity(id: "", name: "All", imageUrl: "")
  ];
  List<ProductEntity> products = [];
  GetSubCategories getSubCategories = Get.find();
  GetAllProducts getAllProducts = Get.find();

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
      offset++;
      loadMoreCategoryProducts();
    }
  }

  changeCategory(int index) {
    selectedIndex = index;
    offset = 0;
    makeMoreItems();
    getAllCategoryProducts();
  }

  List<Tab> get tabs => subCategories
      .map((e) => Tab(
            text: e.name,
          ))
      .toList();

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

  getData() {
    getAllSubCategories();
    getAllCategoryProducts();
  }

  getAllCategoryProducts() async {
    appError = null;
    makeLoading();
    ProductListingParams productListingParams = ProductListingParams(
        sortType: selectedSortType.typeToApiInput(),
        categoryId: categoryEntity.id,
        subcategoryId: subCategories[selectedIndex].id,
        offset: offset,
        filters: []);
    final response = await getAllProducts(productListingParams);
    response.fold((l) => appError = l, (r) {
      setCategoryProducts(r);
    });
    makeNotLoading();
  }

  loadMoreCategoryProducts() async {
    // scrollPosition = scrollController.position.maxScrollExtent;
    makeLoadingMore();
    // await Future.delayed(const Duration(seconds: 3));
    ProductListingParams productListingParams = ProductListingParams(
        sortType: selectedSortType.typeToApiInput(),
        filters: [],
        categoryId: categoryEntity.id,
        subcategoryId: subCategories[selectedIndex].id,
        offset: offset);
    final response = await getAllProducts(productListingParams);
    response.fold((l) => appError = l, (r) {
      addMoreProducts(r);
    });
    makeNotLoadingMore();
    // scrollController.jumpTo(scrollPosition);
  }

  addMoreProducts(ProductListingResponseModel dataModel) {
    final newProducts = dataModel.data!.products;
    consoleLog(newProducts.length);
    if (newProducts.isNotEmpty) {
      products.addAll(dataModel.data!.products);
    } else {
      makeNoMoreItems();
      consoleLog("no more items");
    }
  }

  setCategoryProducts(ProductListingResponseModel dataModel) {
    products = dataModel.data!.products;
  }

  getAllSubCategories() async {
    final response = await getSubCategories(categoryEntity);
    response.fold((l) => appError = l, (r) {
      setSubcategoriesData(r);
    });
    // subCategories.clear();
    // subCategories.addAll(subCategoriesList);
    // if (subCategories[selectedIndex].products.isEmpty) makeLoading();
    // if (selectedIndex == 0) {
    //   subCategories[selectedIndex].products = [
    //     ...chocolates,
    //     ...nonChocolates,
    //     ...homeMade
    //   ];
    // }
    // if (selectedIndex == 1) {
    //   subCategories[selectedIndex].products = chocolates;
    // }
    // if (selectedIndex == 2) {
    //   subCategories[selectedIndex].products = nonChocolates;
    // }
    // if (selectedIndex == 3) {
    //   subCategories[selectedIndex].products = homeMade;
    // }
    // await Future.delayed(const Duration(seconds: 2));
  }

  sortProducts(SortType sortType) {
    selectedSortType = sortType;
    offset = 0;
    getAllCategoryProducts();
  }

  void setSubcategoriesData(SubcategoriesResponseModel r) {
    subCategories.addAll(r.data!.subCategories!);
  }
}

// List<SubCategoryEntity> subCategoriesList = [
//   SubCategoryEntity(
//       name: "All", products: [...chocolates, ...nonChocolates, ...homeMade]),
//   SubCategoryEntity(name: "Chocolates", products: chocolates),
//   SubCategoryEntity(name: "Non-chocolates", products: nonChocolates),
//   SubCategoryEntity(name: "Home made", products: homeMade),
// ];

// List<ProductEntity> chocolates = const [
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Chocolates",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Chocolates",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Chocolates",
//       price: "22.00 SR"),
// ];

// List<ProductEntity> nonChocolates = const [
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Non Chocolates",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Non Chocolates",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Non Chocolates",
//       price: "22.00 SR"),
// ];

// List<ProductEntity> homeMade = const [
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
//   ProductEntity(
//       imageUrl:
//           "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//       name: "Home Made",
//       price: "22.00 SR"),
// ];
