import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/new_indv_mobile.dart';
import 'package:efaq_elhaya/adaptive_layout_widget.dart';
import 'package:flutter/material.dart';

class NewIndvBody extends StatelessWidget {
  const NewIndvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return const NewIndvMobile();
      },
      tabletLayout: (BuildContext context) {
        return const NewIndvMobile();
      },
    );
  }
}
