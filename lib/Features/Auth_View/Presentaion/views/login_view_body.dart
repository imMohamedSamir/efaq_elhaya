import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/login_form.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/registeration_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30.h),
          Image.asset(Assets.imagesLoginImg),
          Gap(16.h),
          LoginForm(),
          Gap(60.h),
          RegisterationQuestion(),
        ],
      ),
    );
  }
}
