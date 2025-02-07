import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/home_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(90.h),
          SvgPicture.asset(Assets.imagesAfaqElhaya),
          Image.asset(Assets.imagesLoginImg),
          Gap(16.h),
          HomeOptions()
        ],
      ),
    );
  }
}
