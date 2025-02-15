// features/cart/domain/use_cases/fetchAddNweCart_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';

class FetchAddNweCartUseCase extends UseCases<CartModel, int> {
 final CartRepo cartRepo;

  FetchAddNweCartUseCase(this.cartRepo);

  @override
  Future<Either<Failure, CartModel>> call(int id, int quant) {
    return cartRepo.fetchAddNewCart(id, quant);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p, parameter t);
}
