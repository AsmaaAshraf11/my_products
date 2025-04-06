// features/favorites/presentation/manger/Featured_add_favorites_Cubit/cubit/fetch_favorites_state.dart
part of 'fetch_favorites_cubit.dart';

@immutable
sealed class FetchFavoritesState {}

final class FetchFavoritesInitial extends FetchFavoritesState {}

class AddFavoritesFailure extends FetchFavoritesState {
  final String errMessage;

  AddFavoritesFailure(this.errMessage);
}

class AddFavoritesSuccess extends FetchFavoritesState {}

class GetFavoritesFailure extends FetchFavoritesState {
  final String errMessage;

  GetFavoritesFailure(this.errMessage);
}

class GetFavoritesSuccess extends FetchFavoritesState {
  final List<ProductsEntity> products;

  GetFavoritesSuccess(this.products);
}

class DeleteFavoritesFailure extends FetchFavoritesState {
  final String errMessage;

  DeleteFavoritesFailure(this.errMessage);
}

class DeleteFavoritesSuccess extends FetchFavoritesState {}
