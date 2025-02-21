import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileImgSec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditProflieBody extends StatelessWidget {
  const EditProflieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        spacing: 16.h,
        children: [
          const ProfileImgSec(name: "محمد"),
          const Gap(20),
          CustomTextField(
            label: LocaleKeys.FirstName.tr(),
            hintText: LocaleKeys.FirstName.tr(),
          ),
          CustomTextField(
            label: LocaleKeys.LastName.tr(),
            hintText: LocaleKeys.LastName.tr(),
          ),
          CustomTextField(
            label: LocaleKeys.PhoneNumber.tr(),
            hintText: LocaleKeys.PhoneNumber.tr(),
          ),
          CustomDropDown(
            hint: LocaleKeys.gender.tr(),
            items: const ["ذكر", "انثى"],
            getLabel: (gender) => gender,
            getValue: (gender) => gender,
          ),
          CustomTextField(
            label: LocaleKeys.Email.tr(),
            hintText: LocaleKeys.EmailHint.tr(),
          ),
        ],
      ),
    );
  }
}
