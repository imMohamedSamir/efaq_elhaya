import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/LogoutBtn.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileDetailsSec.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/ProfileOptionsDetails.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [ProfileDetailsSec(), ProfileOptionsDetails(), LogoutBtn()],
      ),
    );
  }
}
