// features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart
import 'package:bloc/bloc.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchCategory_use_cases.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.fetchcategoryUseCases) : super(CategoryInitial());
  final FetchcategoryUseCases fetchcategoryUseCases;

  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    var result = await fetchcategoryUseCases.call();
    result.fold((failure) {
      emit(CategoryFailure(failure.errorMessage));
    }, (Category) {
      emit(CategorySuccess(Category));
      print('category');
    });
  }
}
