import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class FamilyAddressSec extends StatelessWidget {
  const FamilyAddressSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;
    final ValueNotifier<List<String>> cities = ValueNotifier<List<String>>([]);
    return Column(
      spacing: 16.h,
      children: [
        CustomDropDown(
            isRequired: true,
            isSearch: true,
            initialSelection: cubit.address.governorate,
            hint: LocaleKeys.Governorate.tr(),
            items: metaData.governorates ?? [],
            getLabel: (p0) => p0,
            getValue: (p0) => p0,
            onChanged: (p0) {
              cubit.address.governorate = p0;
              cities.value = metaData.cities?.getCitiesByGovernorate(p0) ?? [];
            }),
        ValueListenableBuilder(
          valueListenable: cities,
          builder: (BuildContext context, List<String> value, Widget? child) {
            return CustomDropDown(
              isRequired: true,
              isSearch: true,
              initialSelection: cubit.address.city,
              hint: LocaleKeys.City.tr(),
              items: value,
              getLabel: (p0) => p0,
              getValue: (p0) => p0,
              onChanged: (p0) {
                cubit.address.city = p0.toString();
              },
            );
          },
        ),
        CustomTextField(
          initialValue: cubit.address.region,
          validator: Validation.general,
          label: LocaleKeys.Area.tr(),
          hintText: LocaleKeys.Area.tr(),
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          onChanged: (p0) {
            cubit.address.region = p0.trim();
          },
        ),
        CustomTextField(
          initialValue: cubit.address.fullAddress,
          validator: Validation.general,
          label: LocaleKeys.fullAddress.tr(),
          hintText: LocaleKeys.fullAddress.tr(),
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.done,
          onChanged: (p0) {
            cubit.address.fullAddress = p0.trim();
          },
        )
      ],
    );
  }
}
