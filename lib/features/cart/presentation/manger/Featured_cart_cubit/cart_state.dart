// features/cart/presentation/manger/Featured_cart_cubit/cart_state.dart
part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartFailure extends CartState {
  final String errMessage;

  CartFailure(this.errMessage);
}

class CartSuccess extends CartState {
  final List<CartModel> cart;

  CartSuccess(this.cart);
}

class DeleteCartFailure extends CartState {
  final String errMessage;

  DeleteCartFailure(this.errMessage);
}

class DeleteCartSuccess extends CartState {}

class UpdateCartSuccess extends CartState {
  final String message;

  UpdateCartSuccess(this.message);
}

class AddCartLoading extends CartState {}

class AddCartFailure extends CartState {
  final String errMessage;

  AddCartFailure(this.errMessage);
}

class AddCartSuccess extends CartState {}

class ApdatCartSuccess extends CartState {}
