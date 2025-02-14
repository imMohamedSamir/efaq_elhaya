import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:password_field_validator/password_field_validator.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
    this.isSignUp = false,
  });

  final void Function(String?)? onSaved;
  final bool isSignUp;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _secure = true;
  final controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            controller: controller,
            maxLines: 1,
            hintText: LocaleKeys.PasswordHint.tr(),
            keyboardType: TextInputType.visiblePassword,
            validator: Validation.password,
            secure: _secure,
            onSaved: widget.onSaved,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _secure = !_secure;
                });
              },
              icon: Icon(_secure ? Icons.visibility_off : Icons.visibility),
            )),
        if (widget.isSignUp) ...[
          Gap(10.h),
          Padding(
            padding: const EdgeInsets.all(8),
            child: PasswordFieldValidator(
              controller: controller,
              minLength: 8,
              uppercaseCharCount: 1,
              lowercaseCharCount: 1,
              numericCharCount: 1,
              specialCharCount: 1,
              defaultColor: Colors.grey,
              successColor: Colors.green,
              failureColor: Colors.red,
              minLengthMessage: LocaleKeys.atLest8.tr(),
              uppercaseCharMessage: LocaleKeys.upperCaseLetter.tr(),
              lowercaseMessage: LocaleKeys.lowerCaseLetter.tr(),
              numericCharMessage: LocaleKeys.numericCharacter.tr(),
              specialCharacterMessage: LocaleKeys.specialCharacter.tr(),
            ),
          ),
        ]
      ],
    );
  }
}
