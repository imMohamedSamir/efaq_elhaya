import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_emp_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvEmploymentIncome extends StatelessWidget {
  const IndvEmploymentIncome({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 16.h,
        children: [
          const IndvEmpSec(),
          CustomTextField(
            initialValue: cubit.employment.income?.toString(),
            hintText: LocaleKeys.income.tr(),
            label: LocaleKeys.income.tr(),
            isEGP: true,
            onChanged: (p0) {
              cubit.employment.income = double.tryParse(p0.trim()) ?? 0;
            },
          ),
          CustomTextField(
            initialValue: cubit.employment.incomeSource,
            validator: Validation.general,
            hintText: LocaleKeys.incomeSource.tr(),
            label: LocaleKeys.incomeSource.tr(),
            onChanged: (p0) {
              cubit.employment.incomeSource = p0.trim();
            },
          ),
        ],
      ),
    );
  }
}
