import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/new_form_layout_mobile.dart';

import 'package:flutter/material.dart';

import '../../../../adaptive_layout_widget.dart';

class NewFromBody extends StatelessWidget {
  const NewFromBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return const NewFormLayoutMobile();
      },
      tabletLayout: (BuildContext context) {
        return const NewFormLayoutMobile();
      },
    );
  }
}
