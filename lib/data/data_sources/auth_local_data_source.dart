import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:learning_app/domain/entities/user_entity.dart';

abstract class AuthenticationLocalDataSource {
  saveUser(UserEntity userEntity);
  deleteUser();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final box = GetStorage();
  @override
  deleteUser() {
    box.remove("user");
  }

  @override
  saveUser(UserEntity userEntity) {
    box.write("user", jsonEncode(userEntity));
  }
}
