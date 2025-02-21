import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/furniture_card.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class FamilyFurnitureDetails extends StatelessWidget {
  const FamilyFurnitureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;
    final Map<String, int> furnitureData = {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        const Divider(thickness: 2),
        Text(
          LocaleKeys.furniture.tr(),
          style:
              AppTextStyles.semiBold18.copyWith(color: ColorManager.secondary),
        ),
        ...metaData.furnitureTypes!
            .map((furniture) => FurnitureCard(
                  title: furniture,
                  onChanged: (int count) {
                    if (count > 0) {
                      furnitureData[furniture] = count;
                    } else {
                      furnitureData.remove(furniture);
                    }
                  },
                ))
            .toList(),
      ],
    );
  }
}
