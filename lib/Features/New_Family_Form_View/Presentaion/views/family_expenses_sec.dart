import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/check_constrains.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyExpensesSec extends StatelessWidget {
  const FamilyExpensesSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        const Divider(color: ColorManager.grey),
        Text(LocaleKeys.expenses.tr(),
            style: AppTextStyles.semiBold18
                .copyWith(color: ColorManager.secondary)),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 70,
            crossAxisCount: isTablet(context) ? 3 : 2,
            crossAxisSpacing: 8,
          ),
          children: [
            for (var item in [
              {
                'key': LocaleKeys.transportation,
                'label': LocaleKeys.transportation
              },
              {'key': LocaleKeys.rent, 'label': LocaleKeys.rent},
              {'key': LocaleKeys.gas, 'label': LocaleKeys.gas},
              {'key': LocaleKeys.electricity, 'label': LocaleKeys.electricity},
              {'key': LocaleKeys.waterBill, 'label': LocaleKeys.waterBill},
              {'key': LocaleKeys.food, 'label': LocaleKeys.food},
              {'key': LocaleKeys.education, 'label': LocaleKeys.education},
              {'key': LocaleKeys.Other, 'label': LocaleKeys.Other},
            ])
              CustomTextField(
                initialValue: _getInitial(cubit: cubit, item: item),
                hintText: item['label']!.tr(),
                label: item['label']!.tr(),
                textInputAction: TextInputAction.next,
                isEGP: true,
                onChanged: (value) => cubit.setExpenses(item['key']!, value),
              ),
          ],
        ),
        const Divider(color: ColorManager.grey),
        CustomTextField(
          controller: cubit.totalExpensesController,
          hintText: LocaleKeys.totalExpenses.tr(),
          label: LocaleKeys.totalExpenses.tr(),
          readOnly: true,
          isEGP: true,
        ),
        //
        CustomTextField(
          controller: cubit.netIncomeController,
          hintText: LocaleKeys.netIncome.tr(),
          label: LocaleKeys.netIncome.tr(),
          isEGP: true,
          readOnly: true,
        ),
        CustomTextField(
          hintText: LocaleKeys.totalExpensesDescription.tr(),
          label: LocaleKeys.totalExpensesDescription.tr(),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  String? _getInitial(
      {required FamilyCubit cubit, required Map<String, String> item}) {
    if (cubit.expensesModel.getExpenseValue(item['key']!) == 0) {
      return null;
    }
    return cubit.expensesModel.getExpenseValue(item['key']!)?.toString() ?? "";
  }
}
