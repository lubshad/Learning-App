import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/update_cart_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class UpdateCart extends UseCase<Map<String, dynamic>, UpdateCartParams> {
  final DataRepository _dataRepository;

  UpdateCart(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      UpdateCartParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.updateCartData(newParams);
  }
}
