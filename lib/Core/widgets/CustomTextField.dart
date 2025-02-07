import 'package:efaq_elhaya/Core/Helpers/AppLang.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.secure,
    this.onChanged,
    this.initialValue,
    this.readOnly,
    this.prefixIcon,
    this.onTap,
    this.maxLines,
    this.suffixIconConstraints,
    this.controller,
    this.autovalidateMode,
    this.focusNode,
    this.label,
    this.enabled = true,
    this.isEGP = false,
    this.filled = false,
    this.onFieldSubmitted,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? label;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? secure;
  final String? initialValue;
  final BoxConstraints? suffixIconConstraints;
  final bool? readOnly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool isEGP;
  final bool filled;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: AppLang.isArabic() ? TextDirection.rtl : TextDirection.ltr,
      maxLines: maxLines,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      style: AppTextStyles.medium18.copyWith(color: const Color(0xff240301)),
      initialValue: initialValue,
      obscureText: secure ?? false,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      decoration: InputDecoration(
        filled: filled,
        fillColor: Colors.white,
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: isEGP
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Text("ج.م", style: AppTextStyles.medium18))
            : suffixIcon,
        prefixIcon: prefixIcon,
        label: label != null ? Text(label!) : null,
        labelStyle: AppLang.isArabic()
            ? AppTextStyles.bold18.copyWith(color: ColorManager.secondary)
            : AppTextStyles.medium16,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorManager.grey, width: 2.5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff9E9D9D))),
        hintText: hintText,
        hintStyle:
            AppTextStyles.medium16.copyWith(color: const Color(0xff9E9D9D)),
        contentPadding: EdgeInsets.only(
            left: AppLang.isArabic() ? 0 : 20,
            top: 16,
            bottom: 16,
            right: AppLang.isArabic() ? 20 : 0),
      ),
    );
  }
}

// class CustomSearchTextField extends StatelessWidget {
//   const CustomSearchTextField({
//     super.key,
//     required this.hintText,
//     this.keyboardType,
//     this.textInputAction,
//     this.validator,
//     this.onSaved,
//     this.suffixIcon,
//     this.secure,
//     this.onChanged,
//     this.initialValue,
//     this.readOnly,
//     this.prefixIcon,
//     this.onTap,
//     this.maxLines,
//     this.suffixIconConstraints,
//     this.controller,
//     this.autovalidateMode,
//     this.focusNode,
//     this.prefixIconConstraints,
//   });
//   final String hintText;
//   final TextInputType? keyboardType;
//   final int? maxLines;
//   final TextInputAction? textInputAction;
//   final String? Function(String?)? validator;
//   final void Function(String?)? onSaved;
//   final void Function(String)? onChanged;
//   final Widget? suffixIcon;
//   final bool? secure;
//   final String? initialValue;
//   final BoxConstraints? suffixIconConstraints;
//   final BoxConstraints? prefixIconConstraints;
//   final bool? readOnly;
//   final Widget? prefixIcon;
//   final void Function()? onTap;
//   final TextEditingController? controller;
//   final AutovalidateMode? autovalidateMode;
//   final FocusNode? focusNode;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLines: maxLines,
//       focusNode: focusNode,
//       autovalidateMode: autovalidateMode,
//       controller: controller,
//       onTap: onTap,
//       readOnly: readOnly ?? false,
//       // enabled: enabled,
//       style: AppStyles.styleMedium16(context)
//           .copyWith(color: const Color(0xff240301)),
//       initialValue: initialValue,
//       obscureText: secure ?? false,
//       onChanged: onChanged,
//       onSaved: onSaved,
//       validator: validator,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       decoration: InputDecoration(
//         suffixIconConstraints: suffixIconConstraints,
//         prefixIconConstraints: prefixIconConstraints,
//         suffixIcon: suffixIcon,
//         prefixIcon: prefixIcon,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         filled: true,
//         fillColor: scColor.withOpacity(0.1),
//         hintText: hintText,
//         hintStyle: AppStyles.styleMedium16(context)
//             .copyWith(color: const Color(0xff9E9D9D)),
//         contentPadding: EdgeInsets.only(
//             left: AppLang.isArabic() ? 0 : 20,
//             top: 18,
//             bottom: 18,
//             right: AppLang.isArabic() ? 20 : 0),
//       ),
//     );
//   }
// }
