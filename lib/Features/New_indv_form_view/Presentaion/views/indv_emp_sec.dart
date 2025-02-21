import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box_tile.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvEmpSec extends StatelessWidget {
  const IndvEmpSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    final ValueNotifier<bool> isEmp = ValueNotifier<bool>(false);
    return Column(
      spacing: 16.h,
      children: [
        CustomCheckBoxTile(
          initialValue: cubit.employment.isEmployed,
          onChanged: (p0) {
            isEmp.value = p0;
            cubit.employment.isEmployed = p0;
          },
          title: LocaleKeys.isEmployed.tr(),
        ),
        ValueListenableBuilder(
          valueListenable: isEmp,
          builder: (BuildContext context, bool value, Widget? child) {
            return CustomTextField(
              initialValue: cubit.employment.job,
              enabled: value,
              hintText: LocaleKeys.job.tr(),
              label: LocaleKeys.job.tr(),
              onChanged: (p0) {
                cubit.employment.job = p0.trim();
              },
            );
          },
        ),
      ],
    );
  }
}
