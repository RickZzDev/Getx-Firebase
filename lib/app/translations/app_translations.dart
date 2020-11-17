import 'package:getXStudy/app/translations/en_US/en_us_translation.dart';
import 'package:getXStudy/app/translations/pt_BR/pt_br_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    "pt_BR": ptBr,
    "en_US": enUs
  };
}
