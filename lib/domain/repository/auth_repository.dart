import 'package:learning_app/data/models/verify_otp_response.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params);
  Future<Either<AppError, UserEntity>> changePassword(
      Map<String, dynamic> params);
  // Future<Either<AppError, VerifyOtpResponse>> verifyOtpLogin(
  //     Map<String, dynamic> params);
  Future<Either<AppError, VerifyOtpResponse>> verifyOtpRegistration(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> resendOtp(
      Map<String, dynamic> params);
}
