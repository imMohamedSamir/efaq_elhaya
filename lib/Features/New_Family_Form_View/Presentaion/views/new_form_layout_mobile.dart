import 'dart:developer';

import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_address_sec.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_details.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_financial_info.dart';
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
    int currentPage = 0;
    List<StepModel> steps = [
      StepModel(
          title: LocaleKeys.familyDetails.tr(), body: const FamilyDetails()),
      StepModel(title: LocaleKeys.address.tr(), body: const FamilyAddressSec()),
      StepModel(
          title: LocaleKeys.FinancialInformation.tr(),
          body: const FamilyFinancialInfo()),
      StepModel(
          title: LocaleKeys.familyDetails.tr(), body: const FamilyDetails()),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AwesomeStepper(
        onStepChanged: (page) {
          currentPage = page;
          log(currentPage.toString());
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
                    text: "back",
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
                    text: "next",
                    txtcolor: Colors.white,
                    onPressed: onNextTapped,
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
