import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/product_details_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetProductDetails
    extends UseCase<ProductDetailsResponseModel, ProductDetailsParams> {
  final DataRepository _dataRepository;

  GetProductDetails(this._dataRepository);
  @override
  Future<Either<AppError, ProductDetailsResponseModel>> call(
      ProductDetailsParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.getProductDetails(newParams);
  }
}
