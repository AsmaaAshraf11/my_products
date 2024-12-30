// features/home/domain/repos/hom_repo.dart

import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class HomRepo {
  Future<Either<Failure, List<String>>> fetchCategory();
  Future<Either<Failure, List<ProductsEntity>>> fetchProducts();
  Future<Either<Failure, List<CartModel>>> fetchCart();
}
