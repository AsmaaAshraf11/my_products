// features/favorites/presentation/manger/Featured_add_favorites_Cubit/cubit/add_favorites_state.dart
part of 'add_favorites_cubit.dart';

@immutable
sealed class AddFavoritesState {}

final class AddFavoritesInitial extends AddFavoritesState {}

class AddFavoritesFailure extends AddFavoritesState {
  final String errMessage;

  AddFavoritesFailure(this.errMessage);
}

class AddFavoritesSuccess extends AddFavoritesState {

}
