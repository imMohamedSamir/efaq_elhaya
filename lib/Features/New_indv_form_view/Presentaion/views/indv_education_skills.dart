import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box_tile.dart';
import 'package:efaq_elhaya/Core/widgets/custom_drop_down.dart';
import 'package:efaq_elhaya/Core/widgets/custom_tags_text_field.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class IndvEducationSkills extends StatelessWidget {
  const IndvEducationSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 16.h,
        children: [
          // const CustomTextField(),
          CustomDropDown(
            initialSelection: cubit.indivFormModel.educationLevel,
            isRequired: true,
            hint: LocaleKeys.educationLevel.tr(),
            items: metaData.educationLevels ?? [],
            getLabel: (p0) => p0,
            getValue: (p0) => p0,
            onChanged: (p0) {
              cubit.indivFormModel.educationLevel = p0.toString();
            },
          ),
          CustomTagsTextField(
            initialValue: cubit.indivFormModel.skills,
            hintText: LocaleKeys.skills.tr(),
            onTagsUpdated: (p0) {
              cubit.indivFormModel.skills = p0;
            },
          ),
          CustomTextField(
            initialValue: cubit.indivFormModel.privateLessons,
            hintText: LocaleKeys.privateLessons.tr(),
            label: LocaleKeys.privateLessons.tr(),
            onChanged: (p0) {
              cubit.indivFormModel.privateLessons = p0.trim();
            },
            isEGP: true,
          ),
          CustomCheckBoxTile(
            initialValue: cubit.indivFormModel.literacySupport,
            title: LocaleKeys.literacySupport.tr(),
            onChanged: (p0) {
              cubit.indivFormModel.literacySupport = p0;
            },
          ),
        ],
      ),
    );
  }
}
