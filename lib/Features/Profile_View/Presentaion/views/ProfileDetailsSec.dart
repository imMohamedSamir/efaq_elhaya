import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileImgSec.dart';
import 'package:flutter/material.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImgSec(name: "مصعب"),
        // Gap(6),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("محمد",
                  style: AppTextStyles.semiBold18
                      .copyWith(fontSize: 24, color: const Color(0xff212121))),
              Text("الرتبه : باحث", style: AppTextStyles.semiBold18),
            ],
          ),
        )
      ],
    );
  }
}
