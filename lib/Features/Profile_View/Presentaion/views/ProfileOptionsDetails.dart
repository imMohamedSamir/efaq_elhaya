import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileOptionsCard.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_card_model.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});
  static List<ProfileOptionsCardModel> options = [
    ProfileOptionsCardModel(
        title: LocaleKeys.editProfile.tr(),
        icon: Icons.person,
        page: const SizedBox()),
    ProfileOptionsCardModel(
        title: LocaleKeys.HelpCenter.tr(),
        icon: Icons.help_center,
        page: const SizedBox()),
    ProfileOptionsCardModel(
        title: LocaleKeys.PrivacyPolicy.tr(),
        icon: Icons.privacy_tip_rounded,
        page: const SizedBox())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                card: options[index],
              )),
    );
  }
}
