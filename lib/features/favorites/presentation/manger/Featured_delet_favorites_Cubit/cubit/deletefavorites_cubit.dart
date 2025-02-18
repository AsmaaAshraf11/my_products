// features/favorites/presentation/manger/Featured_delet_favorites_Cubit/cubit/deletefavorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/favorites/domain/use_cases/deleteFavorites_use_cases%20.dart';

part 'deletefavorites_state.dart';

class DeletefavoritesCubit extends Cubit<DeletefavoritesState> {
  DeletefavoritesCubit(this.deletefavoritesUseCases) : super(DeletefavoritesInitial());

  static DeletefavoritesCubit get(context) => BlocProvider.of(context);


  final DeletefavoritesUseCases deletefavoritesUseCases;
  Future<void> DeleteFavorites(int id ) async {
    try{
          var data = await deletefavoritesUseCases.call(id);

          print(' delete');
          
           emit(DeleteFavoritesSuccess());

    }catch(erorr) {
          print(' error delet${erorr.toString()}');
          emit(DeleteFavoritesFailure(erorr.toString()));
        };
    
     
    
  }
}
