// features/home/presentation/manger/Featured_cart_cubit/cubit/cart_state.dart
part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartFailure extends CartState {
   String errMessage;

  CartFailure( this.errMessage);
}

class CartSuccess extends CartState {
  final List<CartModel> cart;

  CartSuccess(this.cart);
}
