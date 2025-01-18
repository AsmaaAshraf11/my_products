// features/login/data/data_source/login_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  
 Future<Either<Failure, LoginModel>> fetchDataLogin({required String name, required String password});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

   @override
  Future<Either<Failure, LoginModel>> fetchDataLogin({required String name, required String password})async {
     try{
      var data = await apiService.post(
        endpoint: Endpoint.login,
        isToken: true,
        parameter: 'login',
        data: {
          'username': name,
          'password':password ,
        });
        LoginModel datalogin = LoginModel.fromJson(data);     
      return right(datalogin);

        
     }on DioException catch (dioError) {

    final failure = ServerFailure.fromDioError(dioError);
    print('Error: ${failure.errorMessage}');
    return left(failure);
  }   
    
    }
 
}
