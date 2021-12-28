import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/auth_params.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';

class LoginUser extends UseCase<Map<String, dynamic>, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AuthParams params) async {
    return await _authenticationRepository.login(params.toMap());
  }
}
