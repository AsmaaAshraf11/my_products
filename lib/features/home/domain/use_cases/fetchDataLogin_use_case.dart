// features/home/domain/use_cases/fetchDataLogin_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/models/login_model.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchdataloginUseCase extends UseCases<LoginModel, String> {
  final HomRepo homRepo;

  FetchdataloginUseCase(this.homRepo);

  @override
  Future<Either<Failure, LoginModel>> call(String name,String password) async {
    // TODO: implement call
    return await homRepo.fetchDataLogin(name, password);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p,parameter s);
}
