import 'package:dartz/dartz.dart';
import 'package:learning_app/data/models/region_list_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';

class GetRegions extends UseCase<RegionListResponseModel, NoParams> {
  final DataRepository _dataRepository;

  GetRegions(this._dataRepository);
  @override
  Future<Either<AppError, RegionListResponseModel>> call(
      NoParams params) async {
    // AuthController authController = Get.find();
    // final apiInputParams = authController.getUserDetails();
    Map<String, dynamic> params = {};
    return await _dataRepository.getRegions(params);
  }
}
