import 'package:get/get.dart';
import 'package:getXStudy/app/data/model/user_model.dart';
import 'package:getXStudy/app/ui/themes/app_theme.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final UserModel user = Get.arguments;
  RxString txtThemeButton = "Tema: Escuro".obs;
  GetStorage box = GetStorage('getXStudy');

  @override
  void onInit() {
    txtThemeButton.value = Get.isDarkMode ? "Tema: Claro" : "Tema: Escuro";
    super.onInit();
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      box.write('theme', 'light');
      txtThemeButton.value = "Tema: Escuro";
      Get.changeTheme(appThemeData);
    } else {
      box.write('theme', 'dark');

      txtThemeButton.value = "Tema: Claro";
      Get.changeTheme(appThemeDataDark);
    }
  }
}
