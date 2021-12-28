import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/upload_kyc_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class UploadKyc extends UseCase<Map<String, dynamic>, UploadKycParams> {
  final DataRepository _dataRepository;

  UploadKyc(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      UploadKycParams params) async {
    return await _dataRepository.uploadKyc(params.toMap(), params.images);
  }
}
