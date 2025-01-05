// features/home/presentation/manger/featured_new_cart/cubit/new_cart_state.dart
part of 'new_cart_cubit.dart';

@immutable
sealed class NewCartState {}

final class NewCartInitial extends NewCartState {}
class NewCartLoading extends NewCartState {}

class NewCartFailure extends NewCartState {
 final String errMessage;

  NewCartFailure(this.errMessage);
}

class NewCartSuccess extends NewCartState {
  final CartModel cart;

  NewCartSuccess(this.cart);
}
