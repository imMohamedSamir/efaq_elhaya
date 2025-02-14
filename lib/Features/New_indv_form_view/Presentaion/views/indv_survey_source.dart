import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndvSurveySource extends StatelessWidget {
  const IndvSurveySource({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 16,
        children: [
          CustomCheckBox(
              initialValue: cubit.surveySource.phoneSurvey,
              onChanged: (p0) {
                cubit.surveySource.phoneSurvey = p0;
              },
              title: LocaleKeys.phoneSurvey.tr()),
          CustomCheckBox(
              initialValue: cubit.surveySource.fieldSurvey,
              onChanged: (p0) {
                cubit.surveySource.fieldSurvey = p0;
              },
              title: LocaleKeys.fieldSurvey.tr()),
          CustomDatePicker(
            initailValue: cubit.indivFormModel.deathDate,
            hint: LocaleKeys.deathDate.tr(),
            label: LocaleKeys.deathDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.deathDate = p0.toIso8601String();
            },
          ),
          CustomTextField(
            initialValue: cubit.indivFormModel.cancellationReason,
            hintText: LocaleKeys.cancellationReason.tr(),
            label: LocaleKeys.cancellationReason.tr(),
            onChanged: (p0) {
              cubit.indivFormModel.cancellationReason = p0.trim();
            },
          ),
          CustomTextField(
              initialValue: cubit.indivFormModel.notes,
              hintText: LocaleKeys.notes.tr(),
              label: LocaleKeys.notes.tr(),
              onChanged: (p0) {
                cubit.indivFormModel.notes = p0.trim();
              }),
        ],
      ),
    );
  }
}
