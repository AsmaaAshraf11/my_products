// features/favorites/presentation/manger/Featured_add_favorites_Cubit/cubit/add_favorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/favorites/domain/use_cases/fetchfavorites_use_cases.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

part 'add_favorites_state.dart';

class AddFavoritesCubit extends Cubit<AddFavoritesState> {
  AddFavoritesCubit(this.fetchfavoritesUseCases) : super(AddFavoritesInitial());
   static AddFavoritesCubit get(context) => BlocProvider.of(context);


  final FetchfavoritesUseCases fetchfavoritesUseCases;
  
  Future<void> AddFavorites(ProductsEntity product) async {
    try{
          var data = await fetchfavoritesUseCases.call(product);
           emit(AddFavoritesSuccess());
                
    }catch(erorr) {
          print(' error when insert table${erorr.toString()}');
          emit(AddFavoritesFailure(erorr.toString()));
        };
    
     
    
  }
}
