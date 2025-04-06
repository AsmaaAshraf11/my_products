// features/favorites/domain/repos/favorites_repo.dart

import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class FavoritesRepo {
  Future<void> AddFavorites(ProductsEntity product);
  Future<Either<Failure, List<ProductsEntity>>> getFavorites();
  Future<void> deleteFavorites(int id);
}
