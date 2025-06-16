import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(100.h),
          Center(
              child: AspectRatio(
                  aspectRatio: 4.5,
                  child: SvgPicture.asset(Assets.imagesAfaqElhaya))),
          Gap(60.h),
          const LoginForm(),
          // Gap(60.h),
          // const RegisterationQuestion(),
        ],
      ),
    );
  }
}
