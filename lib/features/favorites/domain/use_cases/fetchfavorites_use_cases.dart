// features/favorites/domain/use_cases/fetchfavorites_use_cases.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/favorites/domain/repos/favorites_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class FetchfavoritesUseCases extends UseCase<List<ProductsEntity>, ProductsEntity> {
  final FavoritesRepo favoritesRepo;

  FetchfavoritesUseCases(this.favoritesRepo);

  @override
  Future<void> call(ProductsEntity product) {
    return favoritesRepo.AddFavorites(product);
  }
  
           Future<Either<Failure, List<ProductsEntity>>> NoParam() {
    return favoritesRepo.getFavorites();
  }
  Future<void> Call( int id) {
    return favoritesRepo.deleteFavorites(id);
  }
}

abstract class UseCase<Type, Param> {
  Future<void> call(Param param);
}

class NoParam {}
