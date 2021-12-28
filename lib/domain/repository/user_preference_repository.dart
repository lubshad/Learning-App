import 'dart:ui';

import 'package:learning_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UserPreferencesRepository {
  Future<Either<AppError, Unit>> changeLocale(Locale locale);
}
