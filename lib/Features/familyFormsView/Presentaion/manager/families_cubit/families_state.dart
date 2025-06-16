import 'package:efaq_elhaya/Features/familyFormsView/data/models/family_model.dart';
import 'package:equatable/equatable.dart';

class FamiliesState extends Equatable {
  final bool isLoading;
  final List<FamilyModel>? data;
  final String? error;
  final bool hasMore;

  const FamiliesState({
    this.isLoading = false,
    this.data,
    this.error,
    this.hasMore = true,
  });
  FamiliesState copyWith({
    bool? isLoading,
    List<FamilyModel>? data,
    String? error,
    bool? hasMore,
  }) {
    return FamiliesState(
      isLoading: isLoading ?? false,
      data: data,
      error: error,
      hasMore: hasMore ?? true,
    );
  }

  @override
  List<Object?> get props => [isLoading, data, error];
}
