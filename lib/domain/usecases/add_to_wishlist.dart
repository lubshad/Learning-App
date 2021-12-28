import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/add_to_cart_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class AddToWishlist extends UseCase<Map<String, dynamic>, CartWishlistParams> {
  final DataRepository _dataRepository;

  AddToWishlist(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      CartWishlistParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.addToWishlist(newParams);
  }
}
