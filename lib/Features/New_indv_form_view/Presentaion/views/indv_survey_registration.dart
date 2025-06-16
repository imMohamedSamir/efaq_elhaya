import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/individual_survay_cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvSurveyRegistration extends StatelessWidget {
  const IndvSurveyRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            initialValue: cubit.indivFormModel.researcherName,
            hintText: LocaleKeys.researcherName.tr(),
            label: LocaleKeys.researcherName.tr(),
            textInputAction: TextInputAction.next,
            onSaved: (p0) {
              cubit.indivFormModel.researcherName = p0?.trim();
            },
          ),
          CustomTextField(
              hintText: LocaleKeys.lastModifiedBy.tr(),
              label: LocaleKeys.lastModifiedBy.tr(),
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                cubit.indivFormModel.lastModifiedBy = p0?.trim();
              }),
          CustomTextField(
              hintText: LocaleKeys.registrationLocation.tr(),
              label: LocaleKeys.registrationLocation.tr(),
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                cubit.indivFormModel.registrationLocation = p0?.trim();
              }),
          CustomDatePicker(
            hint: LocaleKeys.surveyDate.tr(),
            label: LocaleKeys.surveyDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.surveyDate = p0;
            },
          ),
          CustomDatePicker(
            hint: LocaleKeys.registrationDate.tr(),
            label: LocaleKeys.registrationDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.registrationDate = p0;
            },
          ),
        ],
      ),
    );
  }
}
