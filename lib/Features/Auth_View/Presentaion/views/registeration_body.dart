import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/login_question.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/registeration_form.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterationBody extends StatelessWidget {
  const RegisterationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(115.h),
            Text(LocaleKeys.CreateAccountHint.tr(),
                style: AppTextStyles.medium24),
            Gap(20.h),
            const RegisterationForm(),
            Gap(30.h),
            const LoginQuestion(),
            Gap(24.h),
          ],
        ),
      ),
    );
  }
}
