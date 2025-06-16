part of 'family_location_cubit.dart';

@immutable
sealed class FamilyLocationState {}

final class FamilyLocationInitial extends FamilyLocationState {}

final class FamilyLocationLoading extends FamilyLocationState {}

final class FamilyLocationSuccess extends FamilyLocationState {}

final class FamilyLocationFailure extends FamilyLocationState {}
