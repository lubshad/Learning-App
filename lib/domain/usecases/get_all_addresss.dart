import 'package:learning_app/data/models/my_address_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetAllAddress extends UseCase<MyAddressResponseModel, NoParams> {
  final DataRepository _dataRepository;

  GetAllAddress(this._dataRepository);
  @override
  Future<Either<AppError, MyAddressResponseModel>> call(NoParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    return await _dataRepository.getAllAddress(apiInputParams.toMap());
  }
}
