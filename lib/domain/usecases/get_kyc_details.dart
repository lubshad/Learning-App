import 'package:learning_app/data/models/kyc_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetKYCDetails extends UseCase<KycDetailsResponseModel, NoParams> {
  final DataRepository _dataRepository;

  GetKYCDetails(this._dataRepository);
  @override
  Future<Either<AppError, KycDetailsResponseModel>> call(
      NoParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    return await _dataRepository.getKYCDetails(apiInputParams.toMap());
  }
}
