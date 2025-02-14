import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_nid_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDetails extends StatelessWidget {
  const FamilyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          hintText: LocaleKeys.familyNumberHint.tr(),
          label: LocaleKeys.familyNumber.tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          hintText: LocaleKeys.familyNameHint.tr(),
          label: LocaleKeys.familyName.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        const FamilyNidSec(),
        CustomTextField(
          hintText: LocaleKeys.status.tr(),
          label: LocaleKeys.status.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          hintText: LocaleKeys.registrationLocation.tr(),
          label: LocaleKeys.registrationLocation.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
