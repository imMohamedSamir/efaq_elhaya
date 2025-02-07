import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle regular10 = TextStyle(
    color: ColorManager.grey,
    fontSize: 10.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular12 = TextStyle(
    color: ColorManager.secondary,
    fontSize: 10.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  static TextStyle medium16 = TextStyle(
    color: ColorManager.grey,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium18 = TextStyle(
    color: ColorManager.secondary,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium20 = TextStyle(
    color: ColorManager.primary,
    fontSize: 20.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium24 = TextStyle(
    color: ColorManager.primary,
    fontSize: 24.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static TextStyle bold18 = TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold = TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );
}
