import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/registration_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class CreateAccount extends UseCase<Map<String, dynamic>, RegistrationParams> {
  final DataRepository _dataRepository;

  CreateAccount(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      RegistrationParams params) async {
    return await _dataRepository.createAccount(params.toMap(), params.images);
  }
}
