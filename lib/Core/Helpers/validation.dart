import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';

class Validation {
  static String? email({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.EmailHint.tr();
    }

    return null;
  }

  static String? password({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.PasswordHint.tr();
    }

    return null;
  }

  static String? gender({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.genderValidation.tr();
    }
    return null;
  }

  static String? firstName({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.FirstNameValidation.tr();
    }
    return null;
  }

  static String? lastName({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.LastNameValidation.tr();
    }
    return null;
  }

  static String? phoneNumber({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return LocaleKeys.phoneValidation.tr();
    }
    if (value.length < 11 || value.length > 11) {
      return LocaleKeys.correctPhoneNumber.tr();
    }
    return null;
  }
}
