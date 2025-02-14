import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomPasswordField.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/login_cubit/login_cubit.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/login_btn_builder.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.SignIn.tr(),
                style: AppTextStyles.medium24
                    .copyWith(color: ColorManager.secondary)),
            Gap(16.h),
            Text(LocaleKeys.Email.tr(),
                style: AppTextStyles.medium16
                    .copyWith(color: ColorManager.secondary, fontSize: 18.sp)),
            Gap(16.h),
            CustomTextField(
              hintText: LocaleKeys.EmailHint.tr(),
              keyboardType: TextInputType.emailAddress,
              validator: Validation.email,
              onSaved: (p0) {
                cubit.email = p0!.trim();
              },
            ),
            Gap(16.h),
            Text(LocaleKeys.Password.tr(),
                style: AppTextStyles.medium16
                    .copyWith(color: ColorManager.secondary, fontSize: 18.sp)),
            Gap(16.h),
            CustomPasswordField(
              onSaved: (p0) {
                cubit.password = p0!.trim();
              },
            ),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(LocaleKeys.forgotPassword.tr(),
                    style: AppTextStyles.medium16
                        .copyWith(color: ColorManager.primary)),
              ],
            ),
            Gap(30.h),
            const LoginBtnBuilder()
          ],
        ),
      ),
    );
  }
}
