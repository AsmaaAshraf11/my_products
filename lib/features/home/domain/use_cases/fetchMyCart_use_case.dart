// features/home/domain/use_cases/fetchMyCart_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchmycartUseCase extends UseCases<List<CartModel>, void> {
  final HomRepo homRepo;

  FetchmycartUseCase(this.homRepo);

  @override
  Future<Either<Failure, List<CartModel>>> call([parameter]) {
    return homRepo.fetchCart();
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call([parameter p]);
}
