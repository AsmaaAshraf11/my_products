// features/search/presentation/manger/featured_search_cubit/search_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/search/domain/use_cases/search_use_cases.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCases) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  final SearchUseCases searchUseCases;
  Future<void> SearchProduct(String product) async {
    emit(SearchLoading());

    var result = await searchUseCases.call(product);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
      print(failure.errorMessage);
    }, (Products) {
      emit(SearchSuccess(Products));
      //  print(Products.length);
      print('search');
    });
  }
}
