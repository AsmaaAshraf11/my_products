// features/login/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/login/domain/use_cases/fetchDataLogin_use_case.dart';

part 'data_login_state.dart';

class DataLoginCubit extends Cubit<DataLoginState> {
  DataLoginCubit(this.fetchdataloginUseCase) : super(DataLoginInitial());
    static DataLoginCubit get(context) => BlocProvider.of(context);

  final FetchdataloginUseCase fetchdataloginUseCase;
  Future<void> fetchDataLogin({required String name,required String password}) async {
    emit(DataLoginLoading());

    var result = await fetchdataloginUseCase.call(name, password);
    result.fold((failure) {
      emit(DataLoginFailure(failure.errorMessage));
      print(failure.errorMessage);
    }, (data) {
      emit(DataLoginSuccess(data));
      print('${data.email}');
    });
  }
}
