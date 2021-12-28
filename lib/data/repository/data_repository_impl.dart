import 'dart:io';

import 'package:learning_app/data/data_sources/remote_data_source.dart';
import 'package:learning_app/data/models/checkout_response_model.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/data/models/kyc_details_response_model.dart';
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
import 'package:learning_app/data/models/link_type_model.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class DataRepositoryImpl extends DataRepository {
  final RemoteDataSource _remoteDataSource;

  DataRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<AppError, LinkTypeModel>> getLinkType(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getLinkType(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, HomeResponseModel>> getHomeData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getHomeData(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, SubcategoriesResponseModel>> getSubCategories(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getSubCategories(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ViewCartResponseModel>> getCartData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getCartData(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MyAddressResponseModel>> getAllAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getAllAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ViewWishListResponseModel>> getWishListData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getWishListData(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> updateCartData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.updateCart(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> createAccount(
      Map<String, dynamic> params, Map<String, File> images) async {
    try {
      final response = await _remoteDataSource.createAccount(params, images);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> removeCartData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.removeCartData(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> removeWishListData(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.removeWishListData(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> uploadKyc(
      Map<String, dynamic> params, Map<String, File> images) async {
    try {
      final response = await _remoteDataSource.uploadKyc(params, images);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addToCart(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addToCart(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, KycDetailsResponseModel>> getKYCDetails(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getKYCDetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MyOrdersResponseModel>> myOrders(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.myOrders(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, OrderDetailsResponseModel>> orderDetails(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.orderDetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductDetailsResponseModel>> getProductDetails(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getProductDetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductListingResponseModel>> getAllProducts(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getAllProducts(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> cancelOrder(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.cancelOrder(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> reOrder(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.reOrder(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CheckoutResponseModel>> checkOutCart(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.checkOutCart(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> versionCheck(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.versionCheck(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addToWishlist(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addToWishlist(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> removeFromWishlist(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.removeFromWishlist(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> editAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.editAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> placeOrder(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.placeOrder(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, RegionListResponseModel>> getRegions(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getRegions(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
