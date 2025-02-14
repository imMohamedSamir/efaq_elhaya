import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyAddressSec extends StatelessWidget {
  const FamilyAddressSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomDropDown(
            // initialSelection: cubit.address.governorate,
            hint: LocaleKeys.Governorate.tr(),
            items: const ["cairo,assiut"],
            getLabel: (p0) => "cairo",
            getValue: (p0) => "",
            onChanged: (p0) {
              // cubit.address.governorate = p0;
            }),
        CustomDropDown(
          // initialSelection: cubit.address.city,
          hint: LocaleKeys.City.tr(),
          items: const ["cairo,assiut"],
          getLabel: (p0) => "cairo",
          getValue: (p0) => "",
          onChanged: (p0) {
            // cubit.address.city = p0.toString();
          },
        ),
        CustomTextField(
          // initialValue: cubit.address.region,
          label: LocaleKeys.Area.tr(),
          hintText: LocaleKeys.Area.tr(),
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          onChanged: (p0) {
            // cubit.address.region = p0.trim();
          },
        ),
        CustomTextField(
          // initialValue: cubit.address.fullAddress,
          label: LocaleKeys.fullAddress.tr(),
          hintText: LocaleKeys.fullAddress.tr(),
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.done,
          onChanged: (p0) {
            // cubit.address.fullAddress = p0.trim();
          },
        )
      ],
    );
  }
}
