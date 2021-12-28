import 'package:learning_app/data/models/order_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/order_details_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class OrderDetails
    extends UseCase<OrderDetailsResponseModel, OrderDetailsParams> {
  final DataRepository _dataRepository;

  OrderDetails(this._dataRepository);
  @override
  Future<Either<AppError, OrderDetailsResponseModel>> call(
      OrderDetailsParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newparams = {};
    newparams.addAll(apiInputParams.toMap());
    newparams.addAll(params.toMap());
    return await _dataRepository.orderDetails(newparams);
  }
}
