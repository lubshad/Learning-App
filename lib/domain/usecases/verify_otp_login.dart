import 'package:learning_app/data/models/verify_otp_response.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/auth_params.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpLogin extends UseCase<VerifyOtpResponse, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  VerifyOtpLogin(this._authenticationRepository);
  @override
  Future<Either<AppError, VerifyOtpResponse>> call(AuthParams params) async {
    return await _authenticationRepository.verifyOtpLogin(params.toMap());
  }
}
