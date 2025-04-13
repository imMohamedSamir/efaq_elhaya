part of 'family_cubit.dart';

@immutable
sealed class FamilyState {}

final class FamilyInitial extends FamilyState {}

final class FamilyLoading extends FamilyState {}

final class FamilySuccess extends FamilyState {}

final class FamilyFailure extends FamilyState {}
