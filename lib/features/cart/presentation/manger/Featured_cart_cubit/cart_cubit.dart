// features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/domain/use_cases/fetchMyCart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.fetchmycartUseCase) : super(CartInitial());
  final FetchmycartUseCase fetchmycartUseCase;

  List<CartModel> cartList = [];
  Future<void> fetchCart({int pageNamber = 0}) async {
    emit(CartLoading());

    var result = await fetchmycartUseCase.call();
    result.fold((failure) {
      emit(CartFailure(failure.errorMessage));
      print('error5 :${failure.errorMessage}');
    }, (cart) {
      cartList = cart;
      emit(CartSuccess(cart));
      print('yes cart');
    });
  }
  // todo  remove cart
  Future<void> removeCart({required int index}) async {

    cartList[0].products!.removeAt(index);
    emit(UpdateCartSuccess(''));
  }

}
