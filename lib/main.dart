import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getXStudy/app/routes/app_pages.dart';
import 'package:getXStudy/app/routes/app_routes.dart';
import 'package:getXStudy/app/translations/app_translations.dart';
import 'package:getXStudy/app/ui/themes/app_theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init('getXStudy');
  GetStorage box = GetStorage('getXStudy');
  runApp(
    GetMaterialApp(
      title: 'Login Firebase',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      theme: box.read('theme') == 'dark'
          ? appThemeDataDark
          : appThemeData ?? appThemeData,
      darkTheme: appThemeDataDark,
      themeMode: ThemeMode.system,
      locale: Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    ),
  );
}
