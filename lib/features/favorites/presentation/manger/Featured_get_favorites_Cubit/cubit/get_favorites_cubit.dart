// features/favorites/presentation/manger/Featured_get_favorites_Cubit/cubit/get_favorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/favorites/domain/use_cases/getFavorites_use_cases%20.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

part 'get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  GetFavoritesCubit(this.getfavoritesUseCases) : super(GetFavoritesInitial());
    final GetfavoritesUseCases getfavoritesUseCases;

  Future<void> GetFavorites() async {
  
          var data = await getfavoritesUseCases.call();
          data.fold((failure) {
      emit(GetFavoritesFailure(failure.errorMessage));
      print(failure.errorMessage);
    },(Products) {
      
      emit(GetFavoritesSuccess(Products));
      print('yes');
    });  
    
  }
}
