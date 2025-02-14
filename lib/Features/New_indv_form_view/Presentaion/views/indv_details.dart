import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/app_meta_data.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_nid_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvDetails extends StatelessWidget {
  const IndvDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            initialValue: cubit.indivFormModel.name,
            hintText: LocaleKeys.name.tr(),
            label: LocaleKeys.name.tr(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validation.general,
            onChanged: (p0) {
              cubit.indivFormModel.name = p0.trim();
            },
          ),
          IndvNidSec(cubit: cubit),
          CustomTextField(
            alwaysValidate: true,
            initialValue: cubit.indivFormModel.phone,
            hintText: LocaleKeys.PhoneNumber.tr(),
            label: LocaleKeys.PhoneNumber.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: Validation.phoneNumber,
            onChanged: (p0) {
              cubit.indivFormModel.phone = p0.trim();
            },
          ),
          CustomDropDown(
            initialSelection: cubit.indivFormModel.gender,
            hint: LocaleKeys.gender.tr(),
            items: AppMetaData.gender,
            getLabel: (gender) => gender,
            getValue: (gender) => gender,
            onChanged: (p0) {
              cubit.indivFormModel.gender = p0!;
            },
          ),
          CustomDatePicker(
            isReqiured: true,
            initailValue: cubit.indivFormModel.birthDate,
            label: LocaleKeys.DOB.tr(),
            hint: LocaleKeys.DOBHint.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.birthDate = p0.toIso8601String();
            },
          ),
        ],
      ),
    );
  }
}
