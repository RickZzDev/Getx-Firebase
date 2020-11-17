import 'package:get/get.dart';
import 'package:getXStudy/app/bindings/home_binding.dart';
import 'package:getXStudy/app/bindings/login_binding.dart';
import 'package:getXStudy/app/routes/app_routes.dart';
import 'package:getXStudy/app/ui/pages/home_page.dart';
import 'package:getXStudy/app/ui/pages/initial_page.dart';
import 'package:getXStudy/app/ui/pages/login_page.dart';
import 'package:getXStudy/app/ui/pages/register_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
        transition: Transition.downToUp,
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.HOME,
        transition: Transition.downToUp,
        page: () => HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: Routes.REGISTER,
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => RegisterPage(),
    ),
  ];
}
