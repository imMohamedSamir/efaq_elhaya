import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/LogoutBtn.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileDetailsSec.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileOptionsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: const [
          ProfileDetailsSec(),
          ProfileOptionsDetails(),
          LogoutBtn()
        ],
      ),
    );
  }
}
