// features/favorites/presentation/manger/Featured_fetch_favorites_Cubit/cubit/fetch_favorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/favorites/domain/use_cases/fetchfavorites_use_cases.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

part 'fetch_favorites_state.dart';

class FetchFavoritesCubit extends Cubit<FetchFavoritesState> {
  FetchFavoritesCubit(this.fetchfavoritesUseCases) : super(FetchFavoritesInitial());
   static FetchFavoritesCubit get(context) => BlocProvider.of(context);

  List<ProductsEntity> favorite =[];
      List<int>idfavorit=[];
  final FetchfavoritesUseCases fetchfavoritesUseCases;
  
  Future<void> AddFavorites(ProductsEntity product) async {
    try{
          await fetchfavoritesUseCases.call(product);
          idfavorit.add(product.productId);
           emit(AddFavoritesSuccess());
                
    }catch(erorr) {
          print(' error when insert table${erorr.toString()}');
          emit(AddFavoritesFailure(erorr.toString()));
        };
    
     
    
  }

   

  Future<void> GetFavorites() async {
  
          var data = await fetchfavoritesUseCases.NoParam();
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
        
        Future<void> DeleteFavorites(int id ) async {
    try{
          var data = await fetchfavoritesUseCases.Call(id);

          print(' delete');
           idfavorit.removeAt(id);
           emit(DeleteFavoritesSuccess());

    }catch(erorr) {
          print(' error delet${erorr.toString()}');
          emit(DeleteFavoritesFailure(erorr.toString()));
        };
    
     
    
  }

   bool isExist({required ProductsEntity product}){
      final iEexist=idfavorit.contains(product);
   return iEexist;
    }

}
