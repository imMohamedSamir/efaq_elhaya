import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/privacy_policy_body.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar.normal(context, title: LocaleKeys.PrivacyPolicy.tr()),
      body: const PrivacyPolicyBody(),
    );
  }
}
