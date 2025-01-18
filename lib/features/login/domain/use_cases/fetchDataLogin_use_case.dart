// features/login/domain/use_cases/fetchDataLogin_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/login/domain/repos/login_repo.dart';

class FetchdataloginUseCase extends UseCases<LoginModel, String> {
  final LoginRepo loginRepo;

  FetchdataloginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginModel>> call(String name,String password) async {
    // TODO: implement call
  try{
    var data;
     data= await loginRepo.fetchDataLogin(name, password);
  
      return right(data);
    } on DioException catch (dioError) {
          // print('object4');

    // Handle DioException and extract server failure
    final failure = ServerFailure.fromDioError(dioError);
    print('Error2: ${failure.errorMessage}');
     return left(failure);
  }
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p,parameter s);
}
