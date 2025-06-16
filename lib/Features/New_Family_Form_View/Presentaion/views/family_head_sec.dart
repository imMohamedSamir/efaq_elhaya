import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyHeadSec extends StatelessWidget {
  const FamilyHeadSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Text(LocaleKeys.HeadoftheFamily.tr(),
            style: AppTextStyles.semiBold18
                .copyWith(color: ColorManager.secondary)),
        CustomTextField(
          hintText: LocaleKeys.name.tr(),
          label: LocaleKeys.name.tr(),
          textInputAction: TextInputAction.next,
          validator: Validation.general,
          // onChanged: (p0) => cubit.newFamilyModel. = p0,
        ),
        CustomTextField(
          alwaysValidate: true,
          hintText: LocaleKeys.PhoneNumber.tr(),
          label: LocaleKeys.PhoneNumber.tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validation.phoneNumber,
          // onChanged: (p0) => cubit.newFamilyModel. = p0,
        ),
        CustomDatePicker(
          label: LocaleKeys.DOB.tr(),
          hint: LocaleKeys.DOB.tr(),
          onSubmit: (p0) {
            // cubit.newFamilyModel. = p0;
          },
        )
      ],
    );
  }
}
