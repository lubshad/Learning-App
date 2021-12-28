import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/repository/user_preference_repository.dart';
import 'package:learning_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ChangeLocale extends UseCase<void, Locale> {
  final UserPreferencesRepository _userPreferencesRepository;

  ChangeLocale(this._userPreferencesRepository);
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, Unit>> call(Locale locale) async {
    return _userPreferencesRepository.changeLocale(locale);
  }
}
