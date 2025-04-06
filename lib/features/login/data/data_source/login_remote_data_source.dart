// features/login/data/data_source/login_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResult> fetchDataLogin(
      {required String name, required String password});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginResult> fetchDataLogin(
      {required String name, required String password}) async {
    var data =
        await apiService.post(endpoint: Endpoint.login, isToken: true, data: {
      'username': name,
      'password': password,
    });
    if (data['accessToken'] != null) {
      LoginModel model = LoginModel.fromJson(data);
      return LoginResult(
          message: 'login success', loginData: model, success: true);
    } else {
      return LoginResult(message: 'Error in login', success: false);
    }
  }
}
