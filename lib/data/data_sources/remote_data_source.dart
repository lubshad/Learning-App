import 'dart:io';

import 'package:learning_app/data/core/api_client.dart';
import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/data/models/checkout_response_model.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/data/models/kyc_details_response_model.dart';
import 'package:learning_app/data/models/link_type_model.dart';
import 'package:learning_app/data/models/my_address_response_model.dart';
import 'package:learning_app/data/models/my_orders_response_model.dart';
import 'package:learning_app/data/models/order_details_response_model.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/data/models/product_list_response_model.dart';
import 'package:learning_app/data/models/region_list_response_model.dart';
import 'package:learning_app/data/models/sub_categories_response_model.dart';
import 'package:learning_app/data/models/view_cart_response_model.dart';
import 'package:learning_app/data/models/view_wishlist_response_model.dart';

abstract class RemoteDataSource {
  Future<LinkTypeModel> getLinkType(Map<String, dynamic> params);
  Future<HomeResponseModel> getHomeData(Map<String, dynamic> params);
  Future<RegionListResponseModel> getRegions(Map<String, dynamic> params);
  Future<SubcategoriesResponseModel> getSubCategories(
      Map<String, dynamic> params);
  Future<ViewCartResponseModel> getCartData(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addAddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> editAddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> createAccount(
      Map<String, dynamic> params, Map<String, File> images);
  Future<Map<String, dynamic>> uploadKyc(
      Map<String, dynamic> params, Map<String, File> images);
  Future<MyAddressResponseModel> getAllAddress(Map<String, dynamic> params);
  Future<KycDetailsResponseModel> getKYCDetails(Map<String, dynamic> params);
  Future<ViewWishListResponseModel> getWishListData(
      Map<String, dynamic> params);
  Future<Map<String, dynamic>> updateCart(Map<String, dynamic> params);
  Future<Map<String, dynamic>> removeCartData(Map<String, dynamic> params);
  Future<Map<String, dynamic>> removeWishListData(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addToCart(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addToWishlist(Map<String, dynamic> params);
  Future<Map<String, dynamic>> removeFromWishlist(Map<String, dynamic> params);
  Future<MyOrdersResponseModel> myOrders(Map<String, dynamic> params);
  Future<OrderDetailsResponseModel> orderDetails(Map<String, dynamic> params);
  Future<ProductDetailsResponseModel> getProductDetails(
      Map<String, dynamic> params);
  Future<ProductListingResponseModel> getAllProducts(
      Map<String, dynamic> params);

  Future<Map<String, dynamic>> cancelOrder(Map<String, dynamic> params);
  Future<Map<String, dynamic>> reOrder(Map<String, dynamic> params);
  Future<CheckoutResponseModel> checkOutCart(Map<String, dynamic> params);
  Future<Map<String, dynamic>> versionCheck(Map<String, dynamic> params);
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> params);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);
  @override
  Future<LinkTypeModel> getLinkType(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.getLinkType, params);
    if (response["status"] == 1) {
      try {
        return LinkTypeModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      return LinkTypeModel(status: response["status"], data: null);
    }
  }

  @override
  Future<HomeResponseModel> getHomeData(Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.home);
    return HomeResponseModel.fromJson(response);
  }

  @override
  Future<SubcategoriesResponseModel> getSubCategories(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.subCategories, params);
    if (response["status"] == 1) {
      try {
        return SubcategoriesResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      return SubcategoriesResponseModel(
          status: response["status"], message: response["message"], data: null);
    }
  }

  @override
  Future<ViewCartResponseModel> getCartData(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.viewCart, params);
    if (response["status"] == 1) {
      try {
        return ViewCartResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> addAddress(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addAddress, params);
    return response;
  }

  @override
  Future<MyAddressResponseModel> getAllAddress(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.getAllAddress, params);
    if (response["status"] == 1) {
      try {
        return MyAddressResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      return MyAddressResponseModel(
          status: response["status"], message: response["message"], data: null);
    }
  }

  @override
  Future<ViewWishListResponseModel> getWishListData(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.viewWishlist, params);
    if (response["status"] == 1) {
      try {
        return ViewWishListResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> updateCart(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.updateCart, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> createAccount(
      Map<String, dynamic> params, Map<String, File> images) async {
    final response = await _apiClient.formData(
        path: ApiConstants.createAccount, data: params, images: images);
    return response;
  }

  @override
  Future<Map<String, dynamic>> removeCartData(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.removeCart, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> removeWishListData(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.removeWishList, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> uploadKyc(
      Map<String, dynamic> params, Map<String, File> images) async {
    final response = await _apiClient.formData(
        path: ApiConstants.uploadKyc, data: params, images: images);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addToCart(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addToCart, params);
    return response;
  }

  @override
  Future<KycDetailsResponseModel> getKYCDetails(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.getKYCDetails, params);
    try {
      return KycDetailsResponseModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<MyOrdersResponseModel> myOrders(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.myOrders, params);
    if (response["status"] == 1) {
      try {
        return MyOrdersResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<OrderDetailsResponseModel> orderDetails(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.orderDetails, params);
    if (response["status"] == 1) {
      try {
        return OrderDetailsResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<ProductDetailsResponseModel> getProductDetails(
      Map<String, dynamic> params) async {
    final response = await _apiClient
        .get(ApiConstants.getProductDetails + params["id"], params: params);
    return ProductDetailsResponseModel.fromJson(response);
  }

  @override
  Future<ProductListingResponseModel> getAllProducts(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.searchSortFilter, params);
    if (response["status"] == 1) {
      try {
        return ProductListingResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      return ProductListingResponseModel(
          status: response["status"],
          message: response["message"],
          data: null,
          productsCount: 0);
    }
  }

  @override
  Future<Map<String, dynamic>> cancelOrder(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.cancelOrder, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> reOrder(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.reOrder, params);
    return response;
  }

  @override
  Future<CheckoutResponseModel> checkOutCart(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.checkOutCart, params);
    if (response["status"] == 1) {
      try {
        return CheckoutResponseModel.fromJson(response);
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> versionCheck(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.versionCheck, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addToWishlist(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addToWishlist, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> removeFromWishlist(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.removeFromWishlist, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.placeOrder, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> editAddress(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.editAddress, params);
    return response;
  }

  @override
  Future<RegionListResponseModel> getRegions(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.regions, params);
    return RegionListResponseModel.fromJson(response);
  }
}
