import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/add_address_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class AddAddress extends UseCase<Map<String, dynamic>, AddAddressParams> {
  final DataRepository _dataRepository;

  AddAddress(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddAddressParams params) async {
    return await _dataRepository.addAddress(params.toMap());
  }
}
