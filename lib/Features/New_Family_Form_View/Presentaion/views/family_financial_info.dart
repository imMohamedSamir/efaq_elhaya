import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_tags_text_field.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_expenses_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyFinancialInfo extends StatelessWidget {
  const FamilyFinancialInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);
    return Column(
      spacing: 16.h,
      children: [
        CustomTagsTextField(
          initialValue: cubit.newFamilyModel.incomeSources,
          label: LocaleKeys.incomeSources.tr(),
          hintText: LocaleKeys.incomeSources.tr(),
          onTagsUpdated: (tags) {
            cubit.newFamilyModel.incomeSources = tags;
          },
          isRequired: true,
        ),
        CustomTextField(
          initialValue: cubit.newFamilyModel.totalIncome?.toString() ?? '',
          hintText: LocaleKeys.totalIncome.tr(),
          label: LocaleKeys.totalIncome.tr(),
          textInputAction: TextInputAction.next,
          isEGP: true,
          validator: Validation.general,
          onChanged: (p0) {
            cubit.setIncome(value: p0);
          },
        ),
        const FamilyExpensesSec()
      ],
    );
  }
}
