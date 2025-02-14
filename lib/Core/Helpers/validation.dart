import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';

class Validation {
  /// ✅ Generic function for required fields
  static String? _validateRequiredField(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? general(String? value) {
    return _validateRequiredField(value, LocaleKeys.genericValidation.tr());
  }

  /// ✅ Email validation
  static String? email(String? value) {
    String? requiredValidation =
        _validateRequiredField(value, LocaleKeys.EmailHint.tr());
    if (requiredValidation != null) return requiredValidation;

    // ✅ Regular expression for email format
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value!)) {
      return LocaleKeys.EmailValidation
          .tr(); // Ensure this key exists in your localization
    }
    return null;
  }

  /// ✅ Password validation
  static String? password(String? value) {
    return _validateRequiredField(value, LocaleKeys.PasswordHint.tr());
  }

  /// ✅ Gender validation
  static String? gender(String? value) {
    return _validateRequiredField(value, LocaleKeys.genderValidation.tr());
  }

  /// ✅ First name validation
  static String? firstName(String? value) {
    return _validateRequiredField(value, LocaleKeys.FirstNameValidation.tr());
  }

  /// ✅ Last name validation
  static String? lastName(String? value) {
    return _validateRequiredField(value, LocaleKeys.LastNameValidation.tr());
  }

  /// ✅ Phone number validation
  static String? phoneNumber(String? value) {
    String? requiredValidation =
        _validateRequiredField(value, LocaleKeys.phoneValidation.tr());
    if (requiredValidation != null) return requiredValidation;

    if (value!.length != 11) {
      return LocaleKeys.correctPhoneNumber.tr();
    }
    return null;
  }

  static String? nid(String? value) {
    String? requiredValidation =
        _validateRequiredField(value, LocaleKeys.NIdValidation.tr());
    if (requiredValidation != null) return requiredValidation;

    if (value!.length != 16) {
      return LocaleKeys.NIdCorrection.tr();
    }
    return null;
  }
}
