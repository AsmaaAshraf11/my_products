// features/favorites/domain/use_cases/getFavorites_use_cases .dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/favorites/domain/repos/favorites_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class GetfavoritesUseCases   {
  final FavoritesRepo favoritesRepo;

  GetfavoritesUseCases(this.favoritesRepo);

  Future<Either<Failure, List<ProductsEntity>>> call() {
    return favoritesRepo.getFavorites();
  }
}

abstract class UseCases<Type, parameter> {
  Future<void> call(parameter p);
}
