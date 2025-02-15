// features/cart/domain/use_cases/fetchDeleteCart_use_cases.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';
class FetchDeletecartUseCases extends UseCases<CartModel, int> {
final CartRepo cartRepo;

  FetchDeletecartUseCases(this.cartRepo);

  @override
  Future<Either<Failure, CartModel>> call(int id) {
    return cartRepo.DeletCart(id);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(int p);
}