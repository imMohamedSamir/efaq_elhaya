import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/LangaugeSec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(context, title: LocaleKeys.Language.tr()),
      body: const LangaugeSec(),
    );
  }
}
