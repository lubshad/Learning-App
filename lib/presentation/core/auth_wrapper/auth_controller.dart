import 'dart:convert';

import 'package:learning_app/domain/entities/user_entity.dart';
import 'package:learning_app/domain/params/api_input_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    getUser();
    observeUser();
  }

  final box = GetStorage();

  UserEntity? get user => _userEntity;

  UserEntity? _userEntity;

  getUser() {
    String? jsonUser = box.read("user");
    if (jsonUser != null) {
      _userEntity = UserEntity.fromJson(jsonDecode(jsonUser));
    }
  }

  observeUser() {
    box.listenKey("user", (user) {
      if (user != null) {
        _userEntity = UserEntity.fromJson(jsonDecode(user));
      } else {
        _userEntity = null;
      }
      notifyListeners();
    });
  }

  ApiInputParams getUserDetails() {
    final sessionId = _userEntity!.sessionId;
    final userId = _userEntity!.userId;
    final language = Get.locale;
    ApiInputParams apiInputParams = ApiInputParams(
        sessionId: sessionId, userId: userId, language: language!.languageCode);
    return apiInputParams;
  }
}
