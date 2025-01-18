// features/login/domain/use_cases/fetchDataLogin_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/login/domain/repos/login_repo.dart';

class FetchdataloginUseCase extends UseCases<LoginResult, String> {
  final LoginRepo loginRepo;

  FetchdataloginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginResult>> call(String name,String password) async {
    // TODO: implement call
    return await loginRepo.fetchDataLogin(name, password);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p,parameter s);
}
