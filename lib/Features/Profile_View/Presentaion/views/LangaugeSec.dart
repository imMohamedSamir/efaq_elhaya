import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/LanguageRadioLT.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class LangaugeSec extends StatelessWidget {
  const LangaugeSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> groupValue = ValueNotifier<String>("");
    _handlInitValue(groupValue: groupValue);
    return ValueListenableBuilder(
      valueListenable: groupValue,
      builder: (BuildContext context, String value, Widget? child) {
        return Column(
          children: [
            LanguageRadioLT(
              title: "English (US)",
              groupValue: value,
              value: kEnglish,
              onChanged: (p0) {
                groupValue.value = p0!;
                changeLanguage(Locale(p0));
              },
            ),
            LanguageRadioLT(
              title: navigatorKey.currentContext!.locale.languageCode == 'en'
                  ? 'Arabic'
                  : 'العربية',
              groupValue: value,
              value: kArabic,
              onChanged: (p0) {
                groupValue.value = p0!;
                changeLanguage(Locale(p0));
              },
            ),
          ],
        );
      },
    );
  }

  void _handlInitValue({required ValueNotifier<String> groupValue}) {
    groupValue.value = navigatorKey.currentContext!.locale.languageCode == 'en'
        ? kEnglish
        : kArabic;
  }

  void changeLanguage(Locale newLocale) {
    navigatorKey.currentContext!.setLocale(newLocale);
    Restart.restartApp();
  }
}
