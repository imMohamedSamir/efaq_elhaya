import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/individual_survay_cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class IndvFamilyAndMarital extends StatelessWidget {
  const IndvFamilyAndMarital({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            initialValue: cubit.familyMember.familyNumber,
            label: LocaleKeys.familyNumber.tr(),
            hintText: LocaleKeys.familyNumberHint.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onChanged: (p0) {
              cubit.familyMember.familyNumber = p0.trim();
            },
          ),
          CustomTextField(
            initialValue: cubit.familyMember.relationToHead,
            label: LocaleKeys.relationToHead.tr(),
            hintText: LocaleKeys.relationToHead.tr(),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onChanged: (p0) {
              cubit.familyMember.relationToHead = p0.trim();
            },
          ),
          CustomTextField(
              initialValue: cubit.indivFormModel.familyNumber,
              label: LocaleKeys.familySource.tr(),
              hintText: LocaleKeys.familySource.tr(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (p0) {
                cubit.indivFormModel.familySource = p0.trim();
              }),
          CustomDropDown(
            initialSelection: cubit.indivFormModel.maritalStatus,
            hint: LocaleKeys.maritalStatus.tr(),
            items: metaData.maritalStatus ?? [],
            getLabel: (status) => status,
            getValue: (status) => status,
            onChanged: (p0) {
              cubit.indivFormModel.maritalStatus = p0.toString();
            },
          ),
          CustomDatePicker(
            initailValue: cubit.indivFormModel.marriageDate,
            hint: LocaleKeys.maritalDate.tr(),
            label: LocaleKeys.maritalDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.marriageDate = p0.toString();
            },
          ),
        ],
      ),
    );
  }
}
