import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/domain/params/auth_params.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class ChangePassword extends UseCase<UserEntity, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  ChangePassword(this._authenticationRepository);
  @override
  Future<Either<AppError, UserEntity>> call(AuthParams params) async {
    return await _authenticationRepository.changePassword(params.toMap());
  }
}
