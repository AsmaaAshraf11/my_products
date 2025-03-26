// features/location/presentation/manger/cubit/fetch_location_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:myproducts/features/location/domain/use_cases/fetchlocation_use_cases.dart';

part 'fetch_location_state.dart';

class FetchLocationCubit extends Cubit<FetchLocationState> {
  FetchLocationCubit(this.fetchLocationUseCases) : super(FeaturedLocationInitial());
     static FetchLocationCubit get(context) => BlocProvider.of(context);
    final FetchLocationUseCases fetchLocationUseCases;
    List<LocationModel> locations =[];
    Future<void> addLocation(String address,LatLng LatLng) async {
    try{
           await fetchLocationUseCases.call(address, LatLng).then((valu){
 emit(AddLocationSuccess());
          }
            
          );
           emit(AddLocationSuccess());
                
    }catch(erorr) {
          print(' error when insert table${erorr.toString()}');
          emit(AddLocationFailure(erorr.toString()));
        };     
  }
  Future<void> GetLocation() async {
  
          var data = await fetchLocationUseCases.NoParam();
          data.fold((failure) {
      emit(GetLocationFailure(failure.errorMessage));
      print(failure.errorMessage);
    },(location) {
      locations=location;


  
      emit(GetLocationSuccess(location));
      print('yes');
    });  
  }
  Future<void> DeleteLocation(int id ) async {
    try{
          var data = await fetchLocationUseCases.Call(id);

          print(' delete');
           emit(DeleteLocationSuccess());

    }catch(erorr) {
          print(' error delet${erorr.toString()}');
          emit(DeleteLocationFailure(erorr.toString()));
        };
    
     
    
  }  

}
