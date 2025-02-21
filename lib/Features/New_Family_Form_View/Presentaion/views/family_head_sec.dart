import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyHeadSec extends StatelessWidget {
  const FamilyHeadSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          hintText: LocaleKeys.name.tr(),
          label: LocaleKeys.name.tr(),
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          alwaysValidate: true,
          hintText: LocaleKeys.PhoneNumber.tr(),
          label: LocaleKeys.PhoneNumber.tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validation.phoneNumber,
        ),
        CustomDatePicker(
          label: LocaleKeys.DOB.tr(),
          hint: LocaleKeys.DOB.tr(),
          onSubmit: (p0) {},
        )
      ],
    );
  }
}
