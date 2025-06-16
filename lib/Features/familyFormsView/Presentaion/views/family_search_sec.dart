import 'package:efaq_elhaya/Core/Utlis/custom_btm_sheet.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/families_cubit/families_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilySearchSec extends StatelessWidget {
  const FamilySearchSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FamiliesCubit.get(context);
    final Debouncer _debouncer = Debouncer();

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: CustomTextField(
          hintText: "بحث",
          onChanged: (value) {
            const duration = Duration(milliseconds: 500);
            _debouncer.debounce(
              duration: duration,
              onDebounce: () {
                if (value.isNotEmpty && value != "") {
                  cubit.getFamiliesData(query: value, isRefresh: true);
                } else {
                  cubit.getFamiliesData(query: "", isRefresh: true);
                }
              },
            );
          },
          suffixIcon: IconButton(
              onPressed: () {
                CustomBtmSheet.familiesSearch(
                  context,
                  selectedFilter: cubit.selectedFilter,
                  onChanged: (p0) {
                    cubit.selectedFilter.value = p0;
                  },
                );
              },
              icon: const Icon(Icons.filter_list)),
        ));
  }
}
