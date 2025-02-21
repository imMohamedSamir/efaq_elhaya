import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_Furniture_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_address_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_details.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_docs_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_financial_info.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_head_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_health_medicines.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_other_info_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_survey_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/step_model.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart' as locale;

class NewFormLayoutMobile extends StatelessWidget {
  const NewFormLayoutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPage = 7;
    List<StepModel> steps = [
      StepModel(
          title: LocaleKeys.familyDetails.tr(), body: const FamilyDetails()),
      StepModel(title: LocaleKeys.address.tr(), body: const FamilyAddressSec()),
      StepModel(
          title: LocaleKeys.FinancialInformation.tr(),
          body: const FamilyFinancialInfo()),
      StepModel(
          title: LocaleKeys.HealthMedicines.tr(),
          body: const FamilyHealthMedicines()),
      StepModel(
          title: LocaleKeys.HeadoftheFamily.tr(), body: const FamilyHeadSec()),
      StepModel(
          title: LocaleKeys.LegalPapersDocuments.tr(),
          body: const FamilyDocsSec()),
      StepModel(
          title: LocaleKeys.HomeFurnitureInformation.tr(),
          body: const FamilyFurnitureSec()),
      StepModel(
          title: LocaleKeys.SurveysResearch.tr(),
          body: const FamilySurveySec()),
      StepModel(
          title: LocaleKeys.OtherImportantInformation.tr(),
          body: const FamilyOtherInfoSec()),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AwesomeStepper(
        onStepChanged: (page) {
          currentPage = page;
        },
        headerStyle: AppTextStyles.medium20,
        headerColor: ColorManager.primary.withValues(alpha: 0.2),
        progressColor: ColorManager.primary,
        steps: steps
            .map((step) => AwesomeStepperItem(
                label: step.title,
                content: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: step.body,
                )))
            .toList(),
        controlBuilder: (onNextTapped, onBackTapped) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    btncolor: ColorManager.grey,
                    text: LocaleKeys.back.tr(),
                    txtcolor: Colors.white,
                    onPressed: () {
                      if (currentPage > 0) {
                        onBackTapped();
                      }
                    },
                  ),
                ),
                Gap(16.w),
                Expanded(
                  child: CustomButton(
                    btncolor: ColorManager.primary,
                    text: LocaleKeys.Next.tr(),
                    txtcolor: Colors.white,
                    onPressed: () {
                      if (currentPage < steps.length - 1) {
                        onNextTapped();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
