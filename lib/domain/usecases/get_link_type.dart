import 'package:learning_app/data/models/link_type_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/get_link_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetLinkType extends UseCase<LinkTypeModel, GetLinkParams> {
  final DataRepository dataRepository;
  GetLinkType(this.dataRepository);
  @override
  Future<Either<AppError, LinkTypeModel>> call(GetLinkParams params) async {
    return await dataRepository.getLinkType(params.toMap());
  }
}
