// features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_state.dart
part of 'datailproduct_cubit.dart';

@immutable
sealed class DatailproductState {}

final class DatailproductInitial extends DatailproductState {}

class DatailLoading extends DatailproductState {}

class DatailFailure extends DatailproductState {
  final String errMessage;

  DatailFailure(this.errMessage);
}

class DatailSuccess extends DatailproductState {
  final ProductsEntity products;

  DatailSuccess(this.products);
}
