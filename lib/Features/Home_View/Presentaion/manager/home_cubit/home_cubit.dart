import 'dart:developer';

import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());
  final HomeRepo _repo;
  static HomeCubit get(context) => BlocProvider.of(context);
  final metaDataBox = Hive.box<AppMetaData>(kAppMetaData);
  final UserProfileBox = Hive.box<UserProfile>(kUserProfile);
  void getMetaData() async {
    emit(HomeLoading());
    final result1 = await _repo.getMetaData();
    final result2 = await _repo.getProflie();
    result1.fold((fail) => emit(HomeFailure()), (data) async {
      await _saveMetaData(data: data);
    });
    result2.fold((fail) => emit(HomeFailure()), (data) async {
      await _saveUserProfile(profile: data);
    });
    emit(HomeSuccess());
  }

  Future<void> _saveMetaData({required AppMetaData data}) async {
    await metaDataBox.put(kAppMetaData, data);
  }

  Future<void> _saveUserProfile({required UserProfile profile}) async {
    await UserProfileBox.put(kUserProfile, profile);
    log(UserProfileBox.values.first.toJson().toString());
  }
}
