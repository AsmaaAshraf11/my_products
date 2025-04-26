// features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchDetailProduct_use_case.dart';

part 'datailproduct_state.dart';

class DatailproductCubit extends Cubit<DatailproductState> {
  DatailproductCubit(this.fetchdetailproductUseCase)
      : super(DatailproductInitial());
      static DatailproductCubit get(context) => BlocProvider.of(context);
  //int id
  final FetchdetailproductUseCase fetchdetailproductUseCase;
   ProductsEntity ?detailproduct;
  Future<void> fetchDetail({required int id}) async {
    emit(DatailLoading());

    var result = await fetchdetailproductUseCase.call(id);
    result.fold((failure) {
      emit(DatailFailure(failure.errorMessage));
      print(failure.errorMessage);
    }, (Products) {
      detailproduct=Products;
      emit(DatailSuccess(Products));
      print('detail');
    });
  }
}
