import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileImgSec.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';

class EditProflieBody extends StatelessWidget {
  const EditProflieBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Hive.box<UserProfile>(kUserProfile).values.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          children: [
            ProfileImgSec(name: profile.firstName ?? ""),
            const Gap(20),
            CustomTextField(
              initialValue: profile.firstName ?? "",
              enabled: false,
              label: LocaleKeys.FirstName.tr(),
              hintText: LocaleKeys.FirstName.tr(),
            ),
            CustomTextField(
              initialValue: profile.lastName ?? "",
              enabled: false,
              label: LocaleKeys.LastName.tr(),
              hintText: LocaleKeys.LastName.tr(),
            ),
            CustomTextField(
              initialValue: profile.phoneNumber ?? "",
              enabled: false,
              label: LocaleKeys.PhoneNumber.tr(),
              hintText: LocaleKeys.PhoneNumber.tr(),
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              initialValue: profile.gender ?? "",
              enabled: false,
              label: LocaleKeys.gender.tr(),
              hintText: LocaleKeys.gender.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              initialValue: profile.email ?? "",
              enabled: false,
              label: LocaleKeys.Email.tr(),
              hintText: LocaleKeys.EmailHint.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
