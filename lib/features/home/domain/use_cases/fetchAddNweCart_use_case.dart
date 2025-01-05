// features/home/domain/use_cases/fetchAddNweCart_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchAddNweCartUseCase extends UseCases<CartModel,int> {
  final HomRepo homRepo;

  FetchAddNweCartUseCase(this.homRepo);

  @override
  Future<Either<Failure,CartModel>> call(int id ,int quant) {
    return homRepo.fetchAddNewCart(id, quant);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p,parameter t);
}