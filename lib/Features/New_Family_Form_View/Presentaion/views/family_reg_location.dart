import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_location_cubit/family_location_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FamilyRegLocation extends StatelessWidget {
  const FamilyRegLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyLocationCubit>(context);
    return BlocBuilder<FamilyLocationCubit, FamilyLocationState>(
      builder: (context, state) {
        final isLoading = state is FamilyLocationLoading;
        return SizedBox(
          height: isLoading ? 60.h : null,
          child: ModalProgressHUD(
            progressIndicator:
                const CircularProgressIndicator(color: ColorManager.primary),
            inAsyncCall: isLoading,
            child: CustomTextField(
              validator: Validation.general,
              controller: cubit.controller,
              hintText: LocaleKeys.registrationLocation.tr(),
              label: LocaleKeys.registrationLocation.tr(),
              suffixIcon: IconButton(
                onPressed: () {
                  cubit.setLoc(context);
                },
                icon: const Icon(
                  Icons.location_on_rounded,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
