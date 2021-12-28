import 'dart:io';

import 'package:learning_app/data/models/verify_otp_response.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/data/data_sources/auth_remote_data_source.dart';
import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource);

  @override
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params) async {
    try {
      // ignore: unused_local_variable
      final response = await _authenticationRemoteDataSource.login(params);
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
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.logout(params);
      _authenticationLocalDataSource.deleteUser();
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
  Future<Either<AppError, UserEntity>> changePassword(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.changePassword(params);
      return Right(UserEntity.fromJson(response));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, VerifyOtpResponse>> verifyOtpLogin(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.verifyOtpLogin(params);
      UserEntity? user = response.data;
      if (user != null &&
          RegistrationStatus.values[user.registrationStatus] ==
              RegistrationStatus.verified) {
        _authenticationLocalDataSource.saveUser(user);
      }
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
  Future<Either<AppError, Map<String, dynamic>>> resendOtp(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.resendOtp(params);
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
  Future<Either<AppError, VerifyOtpResponse>> verifyOtpRegistration(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.verifyOtpRegistration(params);
      UserEntity? user = response.data;
      if (user != null &&
          user.registrationStatus as RegistrationStatus ==
              RegistrationStatus.verified) {
        _authenticationLocalDataSource.saveUser(user);
      }
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
