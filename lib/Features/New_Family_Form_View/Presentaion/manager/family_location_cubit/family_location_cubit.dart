import 'package:bloc/bloc.dart';
import 'package:efaq_elhaya/Core/Helpers/location_service.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'family_location_state.dart';

class FamilyLocationCubit extends Cubit<FamilyLocationState> {
  FamilyLocationCubit(this.locationService) : super(FamilyLocationInitial());
  final LocationService locationService;
  final TextEditingController controller = TextEditingController();
  void setLoc(BuildContext context) async {
    emit(FamilyLocationLoading());
    final result = await locationService.determinePosition();
    result.fold((fail) {
      emit(FamilyLocationFailure());
      CustomToastification.errorDialog(
          content: "حدث خطأ فى تحديد الموقع,الرجاء المحاولة لاحقا.");
    }, (location) {
      controller.text = location;
      BlocProvider.of<FamilyCubit>(context)
          .newFamilyModel
          .registrationLocation = location;
      emit(FamilyLocationSuccess());
    });
  }

  void editLoc(BuildContext context, {required String location}) {
    BlocProvider.of<FamilyCubit>(context).newFamilyModel.registrationLocation =
        location;
  }
}
