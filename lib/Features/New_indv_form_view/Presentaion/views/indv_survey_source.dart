import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box_tile.dart';
import 'package:efaq_elhaya/Core/widgets/custom_date_Picker.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_reg_location.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class IndvSurveySource extends StatelessWidget {
  const IndvSurveySource({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 16,
        children: [
          CustomCheckBoxTile(
              initialValue: cubit.surveySource.phoneSurvey,
              onChanged: (p0) {
                cubit.surveySource.phoneSurvey = p0;
              },
              title: LocaleKeys.phoneSurvey.tr()),
          CustomCheckBoxTile(
              initialValue: cubit.surveySource.fieldSurvey,
              onChanged: (p0) {
                cubit.surveySource.fieldSurvey = p0;
              },
              title: LocaleKeys.fieldSurvey.tr()),
          const IndvRegLocation(),
          CustomDatePicker(
            initailValue: cubit.indivFormModel.registrationDate,
            isReqiured: true,
            hint: LocaleKeys.registrationDate.tr(),
            label: LocaleKeys.registrationDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.registrationDate = p0.toString();
            },
          ),
          CustomDatePicker(
            initailValue: cubit.indivFormModel.surveyDate,
            isReqiured: true,
            hint: LocaleKeys.surveyDate.tr(),
            label: LocaleKeys.surveyDate.tr(),
            onSubmit: (p0) {
              cubit.indivFormModel.surveyDate = p0.toString();
            },
          ),
          CustomDatePicker(
            initailValue: cubit.indivFormModel.deathDate,
            hint: LocaleKeys.deathDate.tr(),
            label: LocaleKeys.deathDate.tr(),
            // isReqiured: true,
            onSubmit: (p0) {
              cubit.indivFormModel.deathDate = p0;
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
          CustomDropDown(
            initialSelection: cubit.indivFormModel.status,
            hint: LocaleKeys.status.tr(),
            items: metaData.surveyStatus ?? [],
            getLabel: (p0) => p0,
            getValue: (p0) => p0,
            onChanged: (p0) {
              cubit.indivFormModel.status = p0;
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
