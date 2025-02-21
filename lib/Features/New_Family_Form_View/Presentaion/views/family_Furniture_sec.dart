import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_furniture_details.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyFurnitureSec extends StatelessWidget {
  const FamilyFurnitureSec({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextField(
            hintText: LocaleKeys.homeDescription.tr(),
            label: LocaleKeys.homeDescription.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            hintText: LocaleKeys.houseCondition.tr(),
            label: LocaleKeys.houseCondition.tr(),
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            hintText: LocaleKeys.numberOfRooms.tr(),
            label: LocaleKeys.numberOfRooms.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            hintText: LocaleKeys.furnitureDescription.tr(),
            label: LocaleKeys.furnitureDescription.tr(),
            textInputAction: TextInputAction.next,
          ),
          const FamilyFurnitureDetails()
        ],
      ),
    );
  }
}
