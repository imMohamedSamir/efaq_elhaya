import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_doc_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyImagesSec extends StatelessWidget {
  const FamilyImagesSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);
    // final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;
    final List<String> docs = [
      "صورة العلاج",
      "صورة الاثاث",
      "صورة الاجهزة",
    ];
    return Column(
      spacing: 16.h,
      children: docs
          .map((doc) => FamilyDocCard(
                initialFile: cubit.imgData[doc],
                title: doc,
                onChanged: (img) {
                  if (img != null) {
                    cubit.imgData[doc] = img;
                  } else {
                    cubit.imgData.remove(doc);
                  }
                },
              ))
          .toList(),
    );
  }
}
