// features/login/data/data_source/login_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  
  Future<LoginModel> fetchDataLogin({required String name, required String password});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

   @override
  Future<LoginModel> fetchDataLogin({required String name, required String password})async {
    // TODO: implement fetchDataLogin
 var data = await apiService.post(
        endpoint: Endpoint.login,
        isToken: true,
        parameter: 'login',
        data: {
          'username': name,
          'password':password ,
        });
    LoginModel datalogin = LoginModel.fromJson(data);
    return datalogin;  }
 
}
