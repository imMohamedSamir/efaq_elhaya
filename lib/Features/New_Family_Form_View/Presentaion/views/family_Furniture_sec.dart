import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_furniture_details.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyFurnitureSec extends StatelessWidget {
  const FamilyFurnitureSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);

    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          initialValue: cubit.furniture.homeDescription,
          hintText: LocaleKeys.homeDescription.tr(),
          label: LocaleKeys.homeDescription.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (value) => cubit.furniture.homeDescription = value.trim(),
        ),
        CustomTextField(
          initialValue: cubit.furniture.houseCondition,
          hintText: LocaleKeys.houseCondition.tr(),
          label: LocaleKeys.houseCondition.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (value) => cubit.furniture.houseCondition = value.trim(),
        ),
        CustomTextField(
          initialValue: cubit.furniture.numberOfRooms?.toString() ?? '',
          hintText: LocaleKeys.numberOfRooms.tr(),
          label: LocaleKeys.numberOfRooms.tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              cubit.furniture.numberOfRooms = int.tryParse(value),
        ),
        CustomTextField(
          initialValue: cubit.furniture.furnitureDescription,
          hintText: LocaleKeys.furnitureDescription.tr(),
          label: LocaleKeys.furnitureDescription.tr(),
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              cubit.furniture.furnitureDescription = value.trim(),
        ),
        const FamilyFurnitureDetails()
      ],
    );
  }
}
