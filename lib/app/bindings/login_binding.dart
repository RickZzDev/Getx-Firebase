import 'package:get/get.dart';
import 'package:getXStudy/app/controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
