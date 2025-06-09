import 'dart:developer';

import 'package:efaq_elhaya/Core/Extentions/filter_extentions.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/family_model.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/repo/families_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'families_state.dart';

class FamiliesCubit extends Cubit<FamiliesState> {
  FamiliesCubit(this._repo) : super(const FamiliesState()) {
    _handleScroll();
  }
  static FamiliesCubit get(context) => BlocProvider.of(context);
  final FamiliesRepo _repo;
  final ScrollController scrollController = ScrollController();
  SearchFilterType filterType = SearchFilterType.values.first;
  ValueNotifier<SearchFilterType> selectedFilter =
      ValueNotifier(SearchFilterType.name);
  final ValueNotifier<List<FamilyModel>> items = ValueNotifier([]);
  bool _hasMore = true;
  int fixedPageSize = 10;
  int currentPage = 1;
  List<FamilyModel> currentFamilies = [];
  void getFamilies() async {
    emit(state.copyWith(isLoading: true));
    await _repo.getFamiliesData(page: currentPage).then((value) {
      value.fold(
        (failure) {
          emit(state.copyWith(error: failure.errMessage));
        },
        (families) {
          items.value = families.families ?? [];
          _hasMore = (families.totalItems ?? 0) > families.families!.length;
          emit(state.copyWith(data: families.families, hasMore: _hasMore));
          log(families.totalItems.toString());
        },
      );
    });
  }

  void getFamiliesData({
    String? query,
    bool isRefresh = false,
  }) async {
    if (!_hasMore && !isRefresh) return;

    emit(state.copyWith(isLoading: true));

    if (isRefresh) {
      currentPage = 1;
      items.value.clear();
      _hasMore = true;
    }

    final response = await _repo.getFamiliesData(
      page: currentPage,
      familyName: filterType == SearchFilterType.name ? query : "",
      familyNumber: filterType == SearchFilterType.number ? query : "",
      familyPhone: filterType == SearchFilterType.phone ? query : "",
      familyAddress: filterType == SearchFilterType.address ? query : "",
      nid: filterType == SearchFilterType.nid ? query : "",
    );

    response.fold(
      (failure) {
        emit(state.copyWith(error: failure.errMessage, isLoading: false));
      },
      (data) {
        final newList = data.families ?? [];

        if (isRefresh) {
          items.value = newList;
        } else {
          items.value.addAll(newList);
        }

        _hasMore = (data.totalItems ?? 0) > items.value.length;

        emit(state.copyWith(
            data: List<FamilyModel>.from(items.value),
            hasMore: _hasMore,
            isLoading: false));
      },
    );
  }

  Future<bool?> deleteFamily({required String id}) async {
    final result = await _repo.deleteFamily(familyId: id);
    return result.fold(
      (failure) {
        return false;
      },
      (success) {
        items.value.removeWhere((item) => item.id == id);
        return true;
      },
    );
  }

  void _handleScroll() async {
    scrollController.addListener(() async {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (_hasMore) {
          currentPage++;
          await _repo.getFamiliesData(page: currentPage).then((value) {
            value.fold(
              (failure) {
                emit(state.copyWith(error: failure.errMessage));
              },
              (families) {
                if ((families.totalItems ?? 0) > items.value.length) {
                  items.value.addAll(families.families ?? []);
                  log(items.value.length.toString());
                  log(families.totalItems.toString());
                  emit(state.copyWith(data: families.families));
                } else {
                  _hasMore = false;
                  emit(state.copyWith(data: items.value, hasMore: false));
                }
              },
            );
          });
        }
      }
    });
  }
}
