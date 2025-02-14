import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';

class AppMetaData {
  static List<String> status = [
    LocaleKeys.Single.tr(),
    LocaleKeys.Married.tr(),
    LocaleKeys.Widowed.tr(),
    LocaleKeys.Separated.tr(),
    LocaleKeys.Engaged.tr(),
  ];
  static List<String> gender = [
    LocaleKeys.Male.tr(),
    LocaleKeys.Female.tr(),
  ];
  static List<String> educationLVL = [
    "متوسط",
    "مؤهل عالي",
  ];
}
