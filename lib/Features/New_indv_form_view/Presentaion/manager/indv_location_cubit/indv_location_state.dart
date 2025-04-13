part of 'indv_location_cubit.dart';

@immutable
sealed class IndvLocationState {}

final class IndvLocationInitial extends IndvLocationState {}

final class IndvLocationLoading extends IndvLocationState {}

final class IndvLocationSuccess extends IndvLocationState {
  final String location;

  IndvLocationSuccess({required this.location});
}

final class IndvLocationFailure extends IndvLocationState {}
