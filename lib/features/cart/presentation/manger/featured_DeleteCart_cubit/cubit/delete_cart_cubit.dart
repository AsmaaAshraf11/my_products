// features/cart/presentation/manger/featured_DeleteCart_cubit/cubit/delete_cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/domain/use_cases/fetchDeleteCart_use_cases.dart';

part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit(this.fetchDeletecartUseCases) : super(DeleteCartInitial());
    static DeleteCartCubit get(context) => BlocProvider.of(context);

  FetchDeletecartUseCases fetchDeletecartUseCases;
  Future<void> fetchDeleteCart(int id,) async {
    emit(CartLoading());

    var result = await fetchDeletecartUseCases.call(id,);
    result.fold((failure) {
      emit(DeleteCartFailure(failure.errorMessage));
      print('error :${failure.errorMessage}');
    }, (cart) {
      emit(DeleteCartSuccess(cart));
      print('Delete cart');
    });
  }
}
