import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/order_cancel_re_order_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';

class CancelOrder
    extends UseCase<Map<String, dynamic>, OrderCancelReOrderParams> {
  final DataRepository _dataRepository;

  CancelOrder(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      OrderCancelReOrderParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.cancelOrder(newParams);
  }
}
