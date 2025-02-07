import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.txtcolor,
      required this.btncolor,
      this.isborder = false});
  final void Function()? onPressed;
  final String text;
  final Color txtcolor;
  final Color btncolor;
  final bool isborder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: isborder ? WidgetStateProperty.all<double>(0) : null,
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: isborder ? Colors.white : ColorManager.secondary)),
            ),
            backgroundColor: WidgetStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.medium16.copyWith(color: txtcolor),
        ),
      ),
    );
  }
}
