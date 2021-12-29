import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/domain/entities/user_entity.dart';

class AuthScreenController extends ChangeNotifier {
  bool googleButtonLoading = false;
  makeGoogleButtonLoading() {
    googleButtonLoading = true;
    notifyListeners();
  }

  makeGoogleButtonNotLoading() {
    googleButtonLoading = false;
    notifyListeners();
  }

  loginWithGoogle() async {
    if (!googleButtonLoading) {
      makeGoogleButtonLoading();
      GoogleSignIn googleSignIn = GoogleSignIn();
      final authResponse = await googleSignIn.signIn();
      if (authResponse != null) {
        final authId = authResponse.id;
        final email = authResponse.email;
        final name = authResponse.displayName;
        final image = authResponse.photoUrl;
        UserEntity userEntity = UserEntity(
            name: name ?? "Lubshad",
            sessionId: authId,
            userId: authId,
            phone: "9744714697",
            imageUrl: image ??
                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80");
        Get.find<AuthenticationLocalDataSource>().saveUser(userEntity);
      }
      makeGoogleButtonNotLoading();
    }
  }

  void login() {
    UserEntity userEntity = const UserEntity(
            name: "Lubshad",
            sessionId: "authId",
            userId: "authId",
            phone: "9744714697",
            imageUrl:
                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80");
        Get.find<AuthenticationLocalDataSource>().saveUser(userEntity);
  }
}
