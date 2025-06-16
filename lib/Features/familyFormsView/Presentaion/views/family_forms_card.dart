import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_pdf_view.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/family_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyFormsCard extends StatelessWidget {
  const FamilyFormsCard(
      {super.key,
      this.isEven = false,
      required this.family,
      this.confirmDismiss,
      this.onDismissed});
  final bool isEven;
  final FamilyModel family;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(family.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: confirmDismiss,
      onDismissed: onDismissed,
      background: Container(
        decoration: const BoxDecoration(color: Colors.red),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        decoration: BoxDecoration(
          color:
              isEven ? ColorManager.grey.withValues(alpha: .1) : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(family.familyNumber ?? "",
                      style: AppTextStyles.medium16
                          .copyWith(color: ColorManager.secondary))),
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(family.familyName ?? "",
                          style: AppTextStyles.semiBold16),
                      Text(
                        family.phone ?? "",
                        style:
                            AppTextStyles.regular12.copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        family.address ?? "",
                        style:
                            AppTextStyles.regular12.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 35.w,
                    height: 35.h,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        NavigateToPage.slideFromRight(
                            context: context,
                            page: FamilyPdfView(familyModel: family));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
