import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/profile_body.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.main(context, title: LocaleKeys.profile.tr()),
      body: const ProfileBody(),
    );
  }
}
