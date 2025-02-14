import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_tags_text_field.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_expenses_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyFinancialInfo extends StatelessWidget {
  const FamilyFinancialInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          CustomTagsTextField(
              label: LocaleKeys.incomeSource.tr(),
              hintText: LocaleKeys.incomeSource.tr(),
              onTagsUpdated: (tags) {}),
          CustomTextField(
            hintText: LocaleKeys.totalIncome.tr(),
            label: LocaleKeys.totalIncome.tr(),
            textInputAction: TextInputAction.next,
            isEGP: true,
          ),
          const FamilyExpensesSec()
        ],
      ),
    );
  }
}
