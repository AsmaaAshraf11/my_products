// features/location/presentation/manger/cubit/fetch_location_state.dart
part of 'fetch_location_cubit.dart';

@immutable
sealed class FetchLocationState {}

final class FeaturedLocationInitial extends FetchLocationState {}

class AddLocationFailure extends FetchLocationState {
  final String errMessage;

  AddLocationFailure(this.errMessage);
}

class AddLocationSuccess extends FetchLocationState {}

class GetLocationFailure extends FetchLocationState {
  final String errMessage;

  GetLocationFailure(this.errMessage);
}

class GetLocationSuccess extends FetchLocationState {
  final List<LocationModel> locations;

  GetLocationSuccess(this.locations);
}

class DeleteLocationFailure extends FetchLocationState {
  final String errMessage;

  DeleteLocationFailure(this.errMessage);
}

class DeleteLocationSuccess extends FetchLocationState {}
