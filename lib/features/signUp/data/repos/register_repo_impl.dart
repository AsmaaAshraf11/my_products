// features/signUp/data/repos/register_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/signUp/data/data_source/register_remote_data_source.dart';
import 'package:myproducts/features/signUp/domain/repos/register_repo.dart';

class HomeRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;

  HomeRepoImpl({required this.registerRemoteDataSource});

 
        @override
        Future<Either<Failure, LoginModel>> fetchDataRegister(String name, String password) {
          // TODO: implement fetchDataRegister
          throw UnimplementedError();
        }
}
