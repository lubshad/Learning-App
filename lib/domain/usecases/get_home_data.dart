import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/firebase_messaging.dart';

class GetHomeData extends UseCase<HomeResponseModel, NoParams> {
  final DataRepository _dataRepository;

  GetHomeData(this._dataRepository);
  @override
  Future<Either<AppError, HomeResponseModel>> call(NoParams params) async {
    AuthController authController = Get.find();
    final apiInputParams = authController.getUserDetails();
    final fcm = await getToken();
    Map<String, dynamic> newParams = {};
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll({"fcm": fcm});
    return await _dataRepository.getHomeData(newParams);
  }
}
