import 'package:efaq_elhaya/Core/Helpers/location_service.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'indv_location_state.dart';

class IndvLocationCubit extends Cubit<IndvLocationState> {
  IndvLocationCubit(this.locationService) : super(IndvLocationInitial());
  final LocationService locationService;
  final TextEditingController controller = TextEditingController();
  void setLoc(BuildContext context) async {
    emit(IndvLocationLoading());
    final result = await locationService.determinePosition();
    result.fold((fail) {
      emit(IndvLocationFailure());
      CustomToastification.errorDialog(
          content: "حدث خطأ فى تحديد الموقع,الرجاء المحاولة لاحقا.");
    }, (location) {
      controller.text = location;
      BlocProvider.of<IndividualSurvayCubit>(context)
          .indivFormModel
          .registrationLocation = location;
      emit(IndvLocationSuccess(location: location));
    });
  }
}
