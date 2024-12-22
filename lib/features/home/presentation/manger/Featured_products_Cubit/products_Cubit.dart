// features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchProducts_use_cases.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.fetchproductsUseCases) : super(ProductsInitial());

  final FetchproductsUseCases fetchproductsUseCases;
  Future<void> fetchProduct({int pageNamber = 0}) async {
    emit(ProductsLoading());

    var result = await fetchproductsUseCases.call(pageNamber);
    result.fold((failure) {
      emit(ProductsFailure(failure.errorMessage));
      print(failure.errorMessage);
    }, (Products) {
      emit(ProductsSuccess(Products));
      print('yes');
    });
  }
}
