import 'package:easy_localization/easy_localization.dart' as local;
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/step_model.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_address_sec.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_details.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_education_skills.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_employment_incom.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_family_and_marital.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_health_info.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_survey_source.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIndvMobile extends StatelessWidget {
  const NewIndvMobile({super.key});

  /// ✅ **Step List Function (Scalable)**
  List<StepModel> getSteps() {
    return [
      StepModel(
          title: LocaleKeys.individualDetails.tr(), body: const IndvDetails()),
      StepModel(title: LocaleKeys.address.tr(), body: const IndvAddressSec()),
      StepModel(
          title: LocaleKeys.FamilyMaritalStatus.tr(),
          body: const IndvFamilyAndMarital()),
      StepModel(
          title: LocaleKeys.HealthInfo.tr(), body: const IndvHealthInfo()),
      StepModel(
          title: LocaleKeys.EducationSkills.tr(),
          body: const IndvEducationSkills()),
      StepModel(
          title: LocaleKeys.EmploymentIncome.tr(),
          body: const IndvEmploymentIncome()),
      // StepModel(
      //     title: LocaleKeys.SurveyRegistrationDetails.tr(),
      //     body: const IndvSurveyRegistration()),
      StepModel(
          title: LocaleKeys.SurveySourceNotes.tr(),
          body: const IndvSurveySource())
    ];
  }

  StepState getStepState(int index, int currentStep) {
    if (index < currentStep) return StepState.complete;
    if (index == currentStep) return StepState.editing;
    return StepState.indexed;
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);
    final steps = getSteps();

    return Form(
      key: cubit.formKey,
      child: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, stepIndex, child) {
          return Stepper(
            clipBehavior: Clip.antiAlias,
            type: StepperType.vertical,
            currentStep: stepIndex,
            onStepTapped: (index) =>
                currentPage.value = index, // Efficient update
            steps: steps.asMap().entries.map((entry) {
              int index = entry.key;
              StepModel step = entry.value;
              return Step(
                state: getStepState(index, stepIndex),
                title: Text(
                  step.title,
                  style: AppTextStyles.semiBold18
                      .copyWith(color: ColorManager.secondary),
                ),
                content: step.body,
              );
            }).toList(),

            // stepIconBuilder: (stepIndex, stepState) {
            //   if (stepState == StepState.complete) {
            //     return const Icon(
            //       Icons.check_circle,
            //       color: ColorManager.primary,
            //       blendMode: BlendMode.color,
            //     );
            //   }
            //   return null;
            // },
            controlsBuilder: (context, details) {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
