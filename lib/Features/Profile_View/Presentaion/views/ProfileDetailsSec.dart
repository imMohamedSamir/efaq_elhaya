import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileImgSec.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Hive.box<UserProfile>(kUserProfile).values.first;
    return Column(
      spacing: 8,
      children: [
        ProfileImgSec(name: name.firstName ?? ""),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${name.firstName} ${name.lastName} ",
                  style: AppTextStyles.semiBold18
                      .copyWith(fontSize: 24, color: const Color(0xff212121))),
              // Text("الرتبه : باحث", style: AppTextStyles.semiBold18),
            ],
          ),
        )
      ],
    );
  }
}
