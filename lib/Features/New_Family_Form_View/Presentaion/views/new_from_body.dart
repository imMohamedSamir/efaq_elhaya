import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/new_form_layout_mobile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NewFromBody extends StatelessWidget {
  const NewFromBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyCubit, FamilyState>(
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is FamilyLoading,
            progressIndicator:
                const CircularProgressIndicator(color: ColorManager.secondary),
            child: const NewFormLayoutMobile());
      },
    );
    // AdaptiveLayout(
    //   mobileLayout: (BuildContext context) {
    //     return const NewFormLayoutMobile();
    //   },
    //   tabletLayout: (BuildContext context) {
    //     return const NewFormLayoutMobile();
    //   },
    // );
  }
}
