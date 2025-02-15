// features/search/presentation/manger/featured_search_cubit/search_state.dart
part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}

class SearchSuccess extends SearchState {
  final List<ProductsEntity> products;

  SearchSuccess(this.products);
}