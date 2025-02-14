import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyExpensesSec extends StatelessWidget {
  const FamilyExpensesSec({super.key});

  @override
  Widget build(BuildContext context) {
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.5, crossAxisCount: 2, crossAxisSpacing: 6),
          children: [
            CustomTextField(
              hintText: LocaleKeys.transportation.tr(),
              label: LocaleKeys.transportation.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.rent.tr(),
              label: LocaleKeys.rent.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.gas.tr(),
              label: LocaleKeys.gas.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.electricity.tr(),
              label: LocaleKeys.electricity.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.waterBill.tr(),
              label: LocaleKeys.waterBill.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.food.tr(),
              label: LocaleKeys.food.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
            CustomTextField(
              hintText: LocaleKeys.education.tr(),
              label: LocaleKeys.education.tr(),
              textInputAction: TextInputAction.next,
              isEGP: true,
            ),
          ],
        ),
        CustomTextField(
          hintText: LocaleKeys.totalExpenses.tr(),
          label: LocaleKeys.totalExpenses.tr(),
          readOnly: true,
          isEGP: true,
        ),
        CustomTextField(
          hintText: LocaleKeys.netIncome.tr(),
          label: LocaleKeys.netIncome.tr(),
          isEGP: true,
        ),
        CustomTextField(
          hintText: LocaleKeys.totalExpensesDescription.tr(),
          label: LocaleKeys.totalExpensesDescription.tr(),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
