part of 'individual_survay_cubit.dart';

@immutable
sealed class IndividualSurvayState {}

final class IndividualSurvayInitial extends IndividualSurvayState {}

final class IndividualSurvayLoading extends IndividualSurvayState {}

final class IndividualSurvaySuccess extends IndividualSurvayState {}

final class IndividualSurvayFailure extends IndividualSurvayState {}
