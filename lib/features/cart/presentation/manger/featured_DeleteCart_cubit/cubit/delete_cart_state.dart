// features/home/presentation/manger/featured_DeleteCart_cubit/cubit/delete_cart_state.dart
part of 'delete_cart_cubit.dart';

@immutable
sealed class DeleteCartState {}

final class DeleteCartInitial extends DeleteCartState {}
class CartLoading extends DeleteCartState {}

class DeleteCartFailure extends DeleteCartState {
  final String errMessage;

  DeleteCartFailure(this.errMessage);
}

class DeleteCartSuccess extends DeleteCartState {
  final CartModel cart;

  DeleteCartSuccess(this.cart);
}
