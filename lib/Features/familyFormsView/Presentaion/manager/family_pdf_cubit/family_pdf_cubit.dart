import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'family_pdf_state.dart';

class FamilyPdfCubit extends Cubit<FamilyPdfState> {
  FamilyPdfCubit(this._repo) : super(FamilyPdfInitial());
  static FamilyPdfCubit get(context) => BlocProvider.of(context);
  final FamilyRepo _repo;
  void getPdf({required String id}) async {
    emit(FamilyPdfLoading());
    final result = await _repo.getPdf(id: id);
    result.fold((fail) {
      emit(FamilyPdfFailure());
    }, (pdf) {
      emit(FamilyPdfSuccess(pdf: pdf));
    });
  }
}
