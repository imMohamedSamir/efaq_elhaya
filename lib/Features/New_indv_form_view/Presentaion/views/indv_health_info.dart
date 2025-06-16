import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_tags_text_field.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/individual_survay_cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvHealthInfo extends StatelessWidget {
  const IndvHealthInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            initialValue: cubit.indivFormModel.healthStatus,
            validator: Validation.general,
            label: LocaleKeys.HealthStatus.tr(),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (p0) {
              cubit.indivFormModel.healthStatus = p0.trim();
            },
          ),
          CustomTagsTextField(
            initialValue: cubit.indivFormModel.medications,
            hintText: LocaleKeys.medicationNameHint.tr(),
            label: LocaleKeys.medications.tr(),
            onTagsUpdated: (p0) {
              cubit.indivFormModel.medications = p0;
            },
          ),
          CustomTextField(
              initialValue: cubit.indivFormModel.treatmentCost?.toString(),
              label: LocaleKeys.treatmentCost.tr(),
              hintText: LocaleKeys.treatmentCost.tr(),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              isEGP: true,
              onChanged: (p0) {
                cubit.indivFormModel.treatmentCost =
                    double.tryParse(p0.trim()) ?? 0;
              })
        ],
      ),
    );
  }
}
