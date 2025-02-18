// features/favorites/presentation/manger/Featured_delet_favorites_Cubit/cubit/deletefavorites_state.dart
part of 'deletefavorites_cubit.dart';

@immutable
sealed class DeletefavoritesState {}

final class DeletefavoritesInitial extends DeletefavoritesState {}
class DeleteFavoritesFailure extends DeletefavoritesState {
  final String errMessage;

  DeleteFavoritesFailure(this.errMessage);
}

class DeleteFavoritesSuccess extends DeletefavoritesState {}