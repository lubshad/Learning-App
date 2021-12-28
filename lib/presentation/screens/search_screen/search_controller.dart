import 'package:learning_app/data/models/product_list_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/filter_entity.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/product_listing_params.dart';
import 'package:learning_app/domain/usecases/get_all_products.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/widgets/sorting_button.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends ChangeNotifier {
  AppError? appError;
  bool isLoading = false;

  List<ProductEntity> searchResult = [];

  List<FilterEntity> filters = [];

  String searchKey = "";

  SortType sortType = SortType.lowToHigh;

  changeSortType(SortType value) {
    sortType = value;
    searchProduct(searchKey);
  }

  applyFilters(List<FilterEntity> appliedFilters) {
    filters = appliedFilters;
    searchProduct(searchKey);
  }

  GetAllProducts getAllProducts = Get.find();

  searchProduct(String query) async {
    searchKey = query;
    consoleLog(query);
    if (query.length > 2) {
      makeLoading();
      ProductListingParams productListingParams = ProductListingParams(
          sortType: sortType.typeToApiInput(),
          filters: filters,
          categoryId: "",
          subcategoryId: "",
          offset: offset,
          searchKey: query);
      final response = await getAllProducts(productListingParams);
      response.fold((l) {}, (r) => {setProducts(r)});
    }
    makeNotLoading();
  }

  toFilterScreen() {
    FilterScreenArguments filterScreenArguments =
        FilterScreenArguments(filters: filters, applyFilters: applyFilters);
    Get.toNamed(RouteList.filterScreen, arguments: filterScreenArguments);
  }

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
      consoleLog('Loading More $offset');
      await Future.delayed(const Duration(seconds: 2));
      makeNotLoadingMore();
    }
  }

  void clearSearch() {
    searchResult.clear();
    offset = 0;
  }

  setProducts(ProductListingResponseModel r) {
    searchResult = r.data!.products;
    if (filters.isEmpty) {
      filters = r.data!.filterArray;
      filters[0].filterTypeEntity.selected = true;
    }
  }
}
