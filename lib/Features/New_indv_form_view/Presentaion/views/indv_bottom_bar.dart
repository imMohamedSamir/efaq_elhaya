import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvBottomBar extends StatelessWidget {
  const IndvBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IndividualSurvayCubit>(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: CustomButton(
              text: LocaleKeys.back.tr(),
              txtcolor: Colors.white,
              btncolor: ColorManager.grey,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              text: LocaleKeys.submit.tr(),
              txtcolor: Colors.white,
              btncolor: ColorManager.primary,
              onPressed: () {
                cubit.submit();
              },
            ),
          ),
        ],
      ),
    );
  }
}
