// features/favorites/presentation/manger/Featured_get_favorites_Cubit/cubit/get_favorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/favorites/domain/use_cases/getFavorites_use_cases%20.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

part 'get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  GetFavoritesCubit(this.getfavoritesUseCases) : super(GetFavoritesInitial());
    final GetfavoritesUseCases getfavoritesUseCases;
   static GetFavoritesCubit get(context) => BlocProvider.of(context);

    List<ProductsEntity> favorite =[];
      List<int>idfavorit=[];

  Future<void> GetFavorites() async {
  
          var data = await getfavoritesUseCases.call();
          data.fold((failure) {
      emit(GetFavoritesFailure(failure.errorMessage));
      print(failure.errorMessage);
    },(Products) {
      favorite=Products;

favorite.forEach((product) {
  idfavorit.add(product.productId);
});
//print(favorite[3].productId);

 
      emit(GetFavoritesSuccess(Products));
      print('yes');
    });  
  }
   bool isExist({required ProductsEntity product}){
      final iEexist=favorite.contains(product);
   return iEexist;
    }
}
