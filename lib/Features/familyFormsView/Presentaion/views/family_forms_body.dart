import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/families_cubit/families_cubit.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_forms_list.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_search_sec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FamilyFormsBody extends StatelessWidget {
  const FamilyFormsBody({super.key});

  @override
  Widget build(BuildContext context) {
    FamiliesCubit.get(context).getFamilies();
    return const Column(
      children: [
        FamilySearchSec(),
        Gap(16),
        FamilyFormsList(),
      ],
    );
  }
}
