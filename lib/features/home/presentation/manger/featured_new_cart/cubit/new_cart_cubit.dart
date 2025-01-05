// features/home/presentation/manger/featured_new_cart/cubit/new_cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchAddNweCart_use_case.dart';

part 'new_cart_state.dart';

class NewCartCubit extends Cubit<NewCartState> {
  NewCartCubit(this.fetchAddNweCartUseCase) : super(NewCartInitial());
     static NewCartCubit  get(context)=>BlocProvider.of(context);

  final FetchAddNweCartUseCase fetchAddNweCartUseCase;
  Future<void> fetchNewCart(int id ,int quant) async {
    emit(NewCartLoading());

    var result = await fetchAddNweCartUseCase.call(id, quant);
    result.fold((failure) {
      emit(NewCartFailure(failure.errorMessage));
      print('error5 :${failure.errorMessage}');
    }, (cart) {
      emit(NewCartSuccess(cart));
      print('new cart');
    });
  }
}
