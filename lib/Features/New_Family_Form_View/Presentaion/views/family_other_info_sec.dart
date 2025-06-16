import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class FamilyOtherInfoSec extends StatelessWidget {
  const FamilyOtherInfoSec({super.key});

  @override
  Widget build(BuildContext context) {
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          initialValue: cubit.newFamilyModel.foodBank,
          hintText: LocaleKeys.foodBank.tr(),
          label: LocaleKeys.foodBank.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.foodBank = p0.trim(),
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.mobileType,
          alwaysValidate: true,
          hintText: LocaleKeys.mobileType.tr(),
          label: LocaleKeys.mobileType.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.mobileType = p0.trim(),
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.validForDevelpoment,
          alwaysValidate: true,
          hintText: LocaleKeys.validForDevelopment.tr(),
          label: LocaleKeys.validForDevelopment.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) =>
              cubit.newFamilyModel.validForDevelpoment = p0.trim(),
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.valid,
          alwaysValidate: true,
          hintText: LocaleKeys.valid.tr(),
          label: LocaleKeys.valid.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.valid = p0.trim(),
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.currentCondition,
          alwaysValidate: true,
          hintText: LocaleKeys.currentCondition.tr(),
          label: LocaleKeys.currentCondition.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.currentCondition = p0.trim(),
        ),
        CustomDropDown(
            initialSelection: cubit.newFamilyModel.educated,
            hint: LocaleKeys.educated.tr(),
            items: metaData.educationLevels ?? [],
            getLabel: (p0) => p0,
            getValue: (p0) => p0,
            onChanged: (p0) => cubit.newFamilyModel.educated = p0),
        CustomTextField(
          initialValue: cubit.newFamilyModel.privateLessons,
          alwaysValidate: true,
          hintText: LocaleKeys.privateLessons.tr(),
          label: LocaleKeys.privateLessons.tr(),
          isEGP: true,
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.privateLessons = p0.trim(),
        ),
        CustomTextField(
          alwaysValidate: true,
          hintText: LocaleKeys.rate.tr(),
          label: LocaleKeys.rate.tr(),
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          alwaysValidate: true,
          hintText: LocaleKeys.cancellationReason.tr(),
          label: LocaleKeys.cancellationReason.tr(),
          textInputAction: TextInputAction.next,
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.notes,
          alwaysValidate: true,
          hintText: LocaleKeys.notes.tr(),
          label: LocaleKeys.notes.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (p0) => cubit.newFamilyModel.notes = p0.trim(),
        ),
      ],
    );
  }
}
