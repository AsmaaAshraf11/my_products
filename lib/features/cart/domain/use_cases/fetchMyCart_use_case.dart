// features/cart/domain/use_cases/fetchMyCart_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';

class FetchmycartUseCase extends UseCases<List<CartModel>, void> {
  final CartRepo cartRepo;

  FetchmycartUseCase(this.cartRepo);

  @override
  Future<Either<Failure, List<CartModel>>> call([parameter]) {
    return cartRepo.fetchCart();
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call([parameter p]);
}
