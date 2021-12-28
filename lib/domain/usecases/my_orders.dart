import 'package:learning_app/data/models/my_orders_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/my_orders_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class MyOrders extends UseCase<MyOrdersResponseModel, MyOrdersParams> {
  final DataRepository _dataRepository;

  MyOrders(this._dataRepository);
  @override
  Future<Either<AppError, MyOrdersResponseModel>> call(
      MyOrdersParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newparams = {};
    newparams.addAll(apiInputParams.toMap());
    newparams.addAll(params.toMap());
    return await _dataRepository.myOrders(newparams);
  }
}
