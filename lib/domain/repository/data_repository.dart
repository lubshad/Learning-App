import 'dart:io';

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
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class DataRepository {
  Future<Either<AppError, LinkTypeModel>> getLinkType(
      Map<String, dynamic> params);
  Future<Either<AppError, RegionListResponseModel>> getRegions(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> versionCheck(
      Map<String, dynamic> params);
  Future<Either<AppError, HomeResponseModel>> getHomeData(
      Map<String, dynamic> params);
  Future<Either<AppError, ProductDetailsResponseModel>> getProductDetails(
      Map<String, dynamic> params);
  Future<Either<AppError, ProductListingResponseModel>> getAllProducts(
      Map<String, dynamic> params);
  Future<Either<AppError, KycDetailsResponseModel>> getKYCDetails(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> editAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> createAccount(
      Map<String, dynamic> params, Map<String, File> images);
  Future<Either<AppError, Map<String, dynamic>>> uploadKyc(
      Map<String, dynamic> params, Map<String, File> images);
  Future<Either<AppError, MyAddressResponseModel>> getAllAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, SubcategoriesResponseModel>> getSubCategories(
      Map<String, dynamic> params);
  Future<Either<AppError, ViewCartResponseModel>> getCartData(
      Map<String, dynamic> params);
  Future<Either<AppError, ViewWishListResponseModel>> getWishListData(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> updateCartData(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> removeCartData(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> removeWishListData(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addToCart(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addToWishlist(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> removeFromWishlist(
      Map<String, dynamic> params);
  Future<Either<AppError, MyOrdersResponseModel>> myOrders(
      Map<String, dynamic> params);
  Future<Either<AppError, OrderDetailsResponseModel>> orderDetails(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> cancelOrder(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> reOrder(
      Map<String, dynamic> params);
  Future<Either<AppError, CheckoutResponseModel>> checkOutCart(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> placeOrder(
      Map<String, dynamic> params);
}
