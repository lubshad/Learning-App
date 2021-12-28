import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/api_input_params.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);
  @override
  Future<Either<AppError, void>> call(NoParams params) {
    AuthController authController = Get.find();
    ApiInputParams apiInputParams = authController.getUserDetails();
    return _authenticationRepository.logout(apiInputParams.toMap());
  }
}
