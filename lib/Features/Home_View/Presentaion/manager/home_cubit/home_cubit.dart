import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());
  final HomeRepo _repo;
  static HomeCubit get(context) => BlocProvider.of(context);
  final metaDataBox = Hive.box<AppMetaData>(kAppMetaData);
  void getMetaData() async {
    emit(HomeLoading());
    final result = await _repo.getMetaData();
    result.fold((fail) => emit(HomeFailure()), (data) async {
      await _saveData(data: data);
      emit(HomeSuccess());
    });
  }

  Future<void> _saveData({required AppMetaData data}) async {
    await metaDataBox.put(kAppMetaData, data);
  }
}
