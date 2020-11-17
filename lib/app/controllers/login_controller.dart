import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXStudy/app/data/model/user_model.dart';
import 'package:getXStudy/app/data/repository/login_repository.dart';
import 'package:getXStudy/app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  GetStorage box = GetStorage('getXStudy');

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged() {
    if (box.hasData('auth')) {
      UserModel _userModel = UserModel(
        id: box.read("auth")['id'],
        email: box.read("auth")['email'],
        urlImage: box.read("auth")['urlImage'],
      );
      Get.offAllNamed(Routes.HOME, arguments: _userModel);
    }
  }

  void register() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    UserModel user = await repository.createUser(emailTextController.text,
        passwordTextController.text, nameTextController.text);
    if (user != null) {
      box.write("auth", user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void login() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    UserModel user = await repository.signIn(
        emailTextController.text, passwordTextController.text);
    if (user != null) {
      box.write("auth", user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void logOut() {
    repository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
