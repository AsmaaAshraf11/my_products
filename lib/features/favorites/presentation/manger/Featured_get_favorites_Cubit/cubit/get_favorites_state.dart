// features/favorites/presentation/manger/Featured_get_favorites_Cubit/cubit/get_favorites_state.dart
part of 'get_favorites_cubit.dart';

@immutable
sealed class GetFavoritesState {}

final class GetFavoritesInitial extends GetFavoritesState {}

class GetFavoritesFailure extends GetFavoritesState {
  final String errMessage;

  GetFavoritesFailure(this.errMessage);
}

class GetFavoritesSuccess extends GetFavoritesState {
  final List<ProductsEntity> products;

  GetFavoritesSuccess(this.products);

}