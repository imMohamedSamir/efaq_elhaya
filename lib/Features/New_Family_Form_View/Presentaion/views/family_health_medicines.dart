import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyHealthMedicines extends StatelessWidget {
  const FamilyHealthMedicines({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          initialValue: cubit.medicines.name,
          hintText: LocaleKeys.medicines.tr(),
          label: LocaleKeys.medicines.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (value) => cubit.medicines.name = value.trim(),
        ),
        CustomTextField(
          initialValue: cubit.medicines.description,
          hintText: LocaleKeys.medicationDescription.tr(),
          label: LocaleKeys.medicationDescription.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) => cubit.medicines.description = value.trim(),
        ),
        CustomTextField(
          initialValue: cubit.medicines.dose,
          hintText: LocaleKeys.medicationDose.tr(),
          label: LocaleKeys.medicationDose.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) => cubit.medicines.dose = value.trim(),
        ),
        CustomTextField(
          initialValue: cubit.medicines.cost?.toString() ?? '',
          hintText: LocaleKeys.medicationCost.tr(),
          label: LocaleKeys.medicationCost.tr(),
          textInputAction: TextInputAction.next,
          isEGP: true,
          onChanged: (value) => cubit.medicines.cost = double.tryParse(value),
        ),
        // const CustomFilePickerWidget(),
      ],
    );
  }
}
