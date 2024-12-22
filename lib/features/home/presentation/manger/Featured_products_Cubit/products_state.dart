// features/home/presentation/manger/Featured_products_Cubit/products_state.dart
part of 'products_Cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  final String errMessage;

  ProductsFailure(this.errMessage);
}

class ProductsSuccess extends ProductsState {
  final List<ProductsEntity> products;

  ProductsSuccess(this.products);
}
