import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class FamilyOtherInfoSec extends StatelessWidget {
  const FamilyOtherInfoSec({super.key});

  @override
  Widget build(BuildContext context) {
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;

    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            hintText: LocaleKeys.foodBank.tr(),
            label: LocaleKeys.foodBank.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.mobileType.tr(),
            label: LocaleKeys.mobileType.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.validForDevelopment.tr(),
            label: LocaleKeys.validForDevelopment.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.valid.tr(),
            label: LocaleKeys.valid.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.currentCondition.tr(),
            label: LocaleKeys.currentCondition.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomDropDown(
              hint: LocaleKeys.educated.tr(),
              items: metaData.educationLevels ?? [],
              getLabel: (p0) => p0,
              getValue: (p0) => p0),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.privateLessons.tr(),
            label: LocaleKeys.privateLessons.tr(),
            isEGP: true,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.rate.tr(),
            label: LocaleKeys.rate.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            alwaysValidate: true,
            hintText: LocaleKeys.cancellationReason.tr(),
            label: LocaleKeys.cancellationReason.tr(),
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
