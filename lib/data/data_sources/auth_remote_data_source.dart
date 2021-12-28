import 'package:learning_app/data/core/api_client.dart';
import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/data/models/verify_otp_response.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);
  Future<Map<String, dynamic>> resendOtp(Map<String, dynamic> params);
  logout(Map<String, dynamic> params);
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> params);
  Future<VerifyOtpResponse> verifyOtpLogin(Map<String, dynamic> params);
  Future<VerifyOtpResponse> verifyOtpRegistration(Map<String, dynamic> params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiClient _apiClient;
  AuthenticationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Map<String, dynamic>> changePassword(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.changePassword, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.login, params);
    return response;
  }

  @override
  logout(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.logout, params);
    return response;
  }

  @override
  Future<VerifyOtpResponse> verifyOtpLogin(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.verifyOtpLogin, params);
    if (response["status"] == 1) {
      return VerifyOtpResponse.fromJson(response);
    } else {
      return VerifyOtpResponse(status: 0, message: response["message"]);
    }
  }

  @override
  Future<Map<String, dynamic>> resendOtp(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.resendOpt, params);
    return response;
  }

  @override
  Future<VerifyOtpResponse> verifyOtpRegistration(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.verifyOtpRegistration, params);
    if (response["status"] == 1) {
      return VerifyOtpResponse.fromJson(response);
    } else {
      return VerifyOtpResponse(status: 0, message: response["message"]);
    }
  }
}
