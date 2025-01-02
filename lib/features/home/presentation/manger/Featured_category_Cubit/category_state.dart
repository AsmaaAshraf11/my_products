// features/home/presentation/manger/Featured_category_Cubit/category_state.dart
part of 'category_Cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List< String> Category;

  CategorySuccess(this.Category);
}

class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure(this.errMessage);
}
