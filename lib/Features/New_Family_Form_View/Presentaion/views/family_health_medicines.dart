import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_file_picker_widget.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyHealthMedicines extends StatelessWidget {
  const FamilyHealthMedicines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          hintText: LocaleKeys.medicines.tr(),
          label: LocaleKeys.medicines.tr(),
          textInputAction: TextInputAction.next,
        ),
        const CustomFilePickerWidget(),
        CustomTextField(
          hintText: LocaleKeys.medicationDescription.tr(),
          label: LocaleKeys.medicationDescription.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          hintText: LocaleKeys.medicationDose.tr(),
          label: LocaleKeys.medicationDose.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          hintText: LocaleKeys.medicationCost.tr(),
          label: LocaleKeys.medicationCost.tr(),
          textInputAction: TextInputAction.next,
          isEGP: true,
        ),
      ],
    );
  }
}
