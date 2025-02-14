import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/individauls_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IndividualsView extends StatelessWidget {
  const IndividualsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.Home(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.45,
              child: Image.asset(
                Assets.imagesIndivHome,
              ),
            ),
            Gap(16.h),
            const IndividaulsOptions()
          ],
        ),
      ),
    );
  }
}
