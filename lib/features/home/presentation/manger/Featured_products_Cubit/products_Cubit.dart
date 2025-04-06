// features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchProducts_use_cases.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.fetchproductsUseCases) : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);

  final FetchproductsUseCases fetchproductsUseCases;
  List<ProductsEntity> SomeProducts = [];
  Future<void> fetchProduct({String category = 'beauty'}) async {
    emit(ProductsLoading());
    var result = await fetchproductsUseCases.call(category);
    result.fold((failure) {
      emit(ProductsFailure(failure.errorMessage));
      print(failure.errorMessage);
    }, (Products) {
      SomeProducts.clear();
      for (int i = 0; i < 4; i++) {
        SomeProducts.add(Products[i]);
      }
      print(SomeProducts.length);
      emit(ProductsSuccess(Products));
      print('yes');
    });
  }
}
