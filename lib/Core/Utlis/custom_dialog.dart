import 'dart:io';

import 'package:efaq_elhaya/Core/widgets/location_msg_widget.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_success_sec.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/logout_msg.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_filter_dialog.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_form_delete.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';

abstract class CustomDialog {
  static void SuccessForm({File? pdf}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
          child: IndvSuccessSec(pdf: pdf),
        );
      },
    ).then((onValue) {
      if (pdf != null && pdf.path.isNotEmpty) {
        pdf.deleteSync();
      }
    });
  }

  static void locationMsg() {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const Dialog(
          child: LocationMsgWidget(),
        );
      },
    );
  }

  static void logoutMsg() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const Dialog(child: LogoutMsg());
      },
    );
  }

  static Future<bool?> familyDeleteMsg({required Function() onDelete}) {
    return showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            child: FamilyFormDelete(
              onDelete: () async {
                final success = await onDelete();
                Navigator.pop(context, success);
              },
            ));
      },
    );
  }

  static void filter({void Function()? onDelete}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const Dialog(
            backgroundColor: Colors.white, child: FamilyFilterDialog());
      },
    );
  }
}
