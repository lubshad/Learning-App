import 'package:learning_app/data/models/checkout_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/checkout_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class CheckoutCart extends UseCase<CheckoutResponseModel, CheckOutParams> {
  final DataRepository _dataRepository;

  CheckoutCart(this._dataRepository);
  @override
  Future<Either<AppError, CheckoutResponseModel>> call(
      CheckOutParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.checkOutCart(newParams);
  }
}
