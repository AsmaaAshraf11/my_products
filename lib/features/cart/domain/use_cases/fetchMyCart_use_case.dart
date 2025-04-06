// features/cart/domain/use_cases/fetchMyCart_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class FetchmycartUseCase extends UseCases<List<CartModel>, void> {
  final CartRepo cartRepo;

  FetchmycartUseCase(this.cartRepo);

  @override
  Future<Either<Failure, List<CartModel>>> call() {
    return cartRepo.fetchCart();
  }

  Future<void> callAdd(ProductsEntity product, int quant) {
    return cartRepo.fetchAddCart(product, quant);
  }

  Future<void> Call(int id) {
    return cartRepo.DeletCart(id);
  }

  Future<void> callUpdat(int id, int quant) {
    return cartRepo.UpdatQuant(id, quant);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call();
}
