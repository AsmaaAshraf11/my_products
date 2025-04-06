// features/signUp/data/data_source/register_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

abstract class RegisterRemoteDataSource {
  Future<LoginModel> fetchDataRegister(
      {required String name, required String password});
}

class RegistRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final ApiService apiService;

  RegistRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginModel> fetchDataRegister(
      {required String name, required String password}) {
    // TODO: implement fetchDataLogin
    throw UnimplementedError();
  }
}
