import 'dart:ui';

import 'package:learning_app/data/data_sources/user_preference_local_data_source.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/repository/user_preference_repository.dart';
import 'package:dartz/dartz.dart';

class UserPreferenceRepositoryImpl extends UserPreferencesRepository {
  final UserPreferenceLocalDataSource _userPreferenceLocalDataSource;

  UserPreferenceRepositoryImpl(this._userPreferenceLocalDataSource);
  @override
  Future<Either<AppError, Unit>> changeLocale(Locale locale) async {
    try {
      await _userPreferenceLocalDataSource.changeLocale(locale);
      return const Right(unit);
    } catch (e) {
      return Left(AppError(AppErrorType.database));
    }
  }
}
