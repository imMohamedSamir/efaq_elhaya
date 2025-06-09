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
      this.withBorder = true});
  final void Function()? onPressed;
  final String text;
  final Color txtcolor;
  final Color btncolor;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: withBorder ? null : WidgetStateProperty.all<double>(2),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: withBorder
                          ? ColorManager.primary
                          : Colors.transparent)),
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
