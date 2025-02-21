import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_reg_location.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilySurveySec extends StatelessWidget {
  const FamilySurveySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          hintText: LocaleKeys.researcherOpinion.tr(),
          label: LocaleKeys.researcherOpinion.tr(),
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          alwaysValidate: true,
          hintText: LocaleKeys.organizationOpinion.tr(),
          label: LocaleKeys.organizationOpinion.tr(),
          textInputAction: TextInputAction.next,
        ),
        const FamilyRegLocation(),
        CustomDatePicker(
          label: LocaleKeys.researchLastDate.tr(),
        )
      ],
    );
  }
}
