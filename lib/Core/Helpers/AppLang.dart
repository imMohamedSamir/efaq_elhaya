import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/main.dart';

abstract class AppLang {
  static bool isArabic() {
    return navigatorKey.currentContext!.locale.languageCode == "ar";
  }
}
