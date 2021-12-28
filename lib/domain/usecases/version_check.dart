import 'dart:io';

import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/platform.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/params/version_check_params.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionCheck extends UseCase<Map<String, dynamic>, NoParams> {
  final DataRepository _dataRepository;
  VersionCheck(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(NoParams params) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.buildNumber;

    DevicePlatform platform =
        Platform.isAndroid ? DevicePlatform.android : DevicePlatform.ios;

    VersionCheckParams versionCheckParams =
        VersionCheckParams(platform: platform, version: version);

    return await _dataRepository.versionCheck(versionCheckParams.toMap());
  }
}
