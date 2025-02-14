import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_success_sec.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void IndivSuccess() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const Dialog(
          child: IndvSuccessSec(),
        );
      },
    );
  }
}
