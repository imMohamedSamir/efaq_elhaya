import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/HomeOptionCard.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/home_option_model.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/new_family_form_view.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FamilOptions extends StatelessWidget {
  const FamilOptions({super.key});
  static List<HomeOptionModel> options = [
    HomeOptionModel(
        title: LocaleKeys.createFamilyForm.tr(),
        icon: Icons.post_add_rounded,
        isActive: true,
        route: const NewFamilyFormView()),
    HomeOptionModel(
        title: LocaleKeys.pendingForms.tr(),
        icon: Icons.pending_actions_rounded,
        route: const SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.phoneForm.tr(),
        icon: Icons.phone,
        route: const SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.shareFamilyForm.tr(),
        icon: Icons.share,
        route: const SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.SubmitStoredForm.tr(),
        icon: Icons.send_rounded,
        route: const SizedBox()),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          children:
              options.map((option) => HomeOptionCard(option: option)).toList()),
    );
  }
}
