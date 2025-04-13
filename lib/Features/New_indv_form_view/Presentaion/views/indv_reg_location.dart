import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/indv_location_cubit/indv_location_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class IndvRegLocation extends StatelessWidget {
  const IndvRegLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<IndvLocationCubit>();

    return BlocBuilder<IndvLocationCubit, IndvLocationState>(
      builder: (context, state) {
        final isLoading = state is IndvLocationLoading;
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
              onChanged: (p0) => cubit.updateLocation(context, location: p0),
            ),
          ),
        );
      },
    );
  }
}
