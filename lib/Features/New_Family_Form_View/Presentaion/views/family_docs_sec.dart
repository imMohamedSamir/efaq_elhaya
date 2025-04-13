import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_doc_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDocsSec extends StatelessWidget {
  const FamilyDocsSec({super.key});

  @override
  Widget build(BuildContext context) {
    // final metaData = Hive.box<AppMetaData>(kAppMetaData).values.first;
    final cubit = BlocProvider.of<FamilyCubit>(context);

    final List<String> docs = [
      "صورة البطاقة",
      "صورة عقد الايجار",
      "فاتورة غاز",
      "فاتورة كهرباء",
      "فاتورة ماء",
    ];
    return Column(
      spacing: 16.h,
      children: docs
          .map((doc) => FamilyDocCard(
                initialFile: cubit.docData[doc],
                title: doc,
                onChanged: (img) {
                  if (img != null) {
                    cubit.docData[doc] = img;
                  } else {
                    cubit.docData.remove(doc);
                  }
                },
              ))
          .toList(),
    );
  }
}
