// features/login/data/repos/login_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/data_source/home_remote_data_source.dart';
import 'package:myproducts/features/login/data/data_source/login_remote_data_source.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginResult>> fetchDataLogin(
      String name, String password) async {
    try {
      var datalogin;
      datalogin = await loginRemoteDataSource.fetchDataLogin(
          name: name, password: password);

      return right(datalogin);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
