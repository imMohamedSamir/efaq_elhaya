import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyNidSec extends StatelessWidget {
  const FamilyNidSec({super.key});

  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);
    final ValueNotifier<bool> isPassport = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: isPassport,
      builder: (BuildContext context, bool value, Widget? child) {
        return Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: CustomTextField(
                alwaysValidate: true,
                initialValue: cubit.newFamilyModel.nationalId,
                hintText: LocaleKeys.NId.tr(),
                label: LocaleKeys.NId.tr(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: isPassport.value ? null : Validation.nid,
                onChanged: (p0) {
                  cubit.newFamilyModel.nationalId = p0.trim();
                },
              ),
            ),
            Column(
              children: [
                Text(LocaleKeys.isPassport.tr(),
                    style: AppTextStyles.medium16
                        .copyWith(color: value ? ColorManager.primary : null)),
                Checkbox(
                    activeColor: ColorManager.primary,
                    value: value,
                    onChanged: (value) {
                      isPassport.value = value!;
                      // cubit.isPassport = value;
                    }),
              ],
            ),
          ],
        );
      },
    );
  }
}
