import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar(
      {super.key, this.currentIndex, required this.onItemTapped});

  final int? currentIndex;
  final void Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 15,
        onTap: onItemTapped,
        currentIndex: currentIndex ?? 0,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: const Color(0xff9E9D9D),
        selectedLabelStyle: AppTextStyles.semiBold18,
        showUnselectedLabels: true,
        unselectedLabelStyle: AppTextStyles.semiBold16,
        selectedIconTheme: IconThemeData(size: 30.r),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.family_restroom_outlined),
            label: LocaleKeys.families.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: LocaleKeys.individuals.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: LocaleKeys.profile.tr(),
          ),
        ]);
  }
}
