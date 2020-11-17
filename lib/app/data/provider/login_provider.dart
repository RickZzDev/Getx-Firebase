import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:getXStudy/app/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginApiClient {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('getXStudy');

  Stream<UserModel> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged
      .map((FirebaseUser user) => UserModel.fromSnapshot(user));

  //Create
  Future<UserModel> createUser(
      String email, String password, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      //Atualizando nome do usuario
      var userUpdateProfile = UserUpdateInfo();
      userUpdateProfile.displayName = name;

      await currentUser.updateProfile(userUpdateProfile);
      await currentUser.reload();

      return UserModel.fromSnapshot(currentUser);
    } catch (e) {
      Get.back();
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.defaultDialog(
              title: "ERROR", content: Text("Email ja cadastrado"));
          break;
        case "ERROR_WRONG_PASSWORD":
          Get.defaultDialog(title: "ERROR", content: Text("Senha incorreta"));
          break;
        case "ERROR_USER_NOT_FOUND":
          Get.defaultDialog(
              title: "ERROR", content: Text("Usuario inexistente"));
          break;

        default:
          Get.defaultDialog(title: "ERROR", content: Text("Erro inesperado"));
          break;
      }
    }
  }

  //Login
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return UserModel.fromSnapshot(currentUser);
    } catch (e) {
      Get.back();
      switch (e.code) {
        case "ERROR_USER_NOT_FOUND":
          Get.defaultDialog(
              title: "ERROR", content: Text("Usuario não encontrado"));
          break;
        case "ERROR_WRONG_PASSWORD":
          Get.defaultDialog(title: "ERROR", content: Text("Senha incorreta"));
          break;
        case "ERROR_USER_NOT_FOUND":
          Get.defaultDialog(
              title: "ERROR", content: Text("Usuario inexistente"));
          break;

        default:
          Get.defaultDialog(title: "ERROR", content: Text("Erro inesperado"));
          break;
      }
      return null;
    }
  }

  //Logoff

  signOut() {
    box.write("auth", null);
    return _firebaseAuth.signOut();
  }
}
