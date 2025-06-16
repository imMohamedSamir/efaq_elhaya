import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_reg_location.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilySurveySec extends StatelessWidget {
  const FamilySurveySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          initialValue: cubit.newFamilyModel.researcherOpinion,
          hintText: LocaleKeys.researcherOpinion.tr(),
          label: LocaleKeys.researcherOpinion.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              cubit.newFamilyModel.researcherOpinion = value.trim(),
        ),
        // CustomTextField(
        //   initialValue: cubit.newFamilyModel.familyOpinion,
        //   alwaysValidate: true,
        //   hintText: LocaleKeys.organizationOpinion.tr(),
        //   label: LocaleKeys.organizationOpinion.tr(),
        //   textInputAction: TextInputAction.next,
        // ),
        const FamilyRegLocation(),
        CustomDatePicker(
          initailValue: cubit.newFamilyModel.lastDistrbution,
          label: LocaleKeys.researchLastDate.tr(),
          onSubmit: (value) => cubit.newFamilyModel.lastDistrbution = value,
        )
      ],
    );
  }
}
