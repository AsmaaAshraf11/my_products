// features/favorites/domain/use_cases/fetchfavorites_use_cases.dart
import 'package:myproducts/features/favorites/domain/repos/favorites_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class FetchfavoritesUseCases extends UseCases<List<ProductsEntity>, ProductsEntity> {
  final FavoritesRepo favoritesRepo;

  FetchfavoritesUseCases(this.favoritesRepo);

  @override
  Future<void> call(ProductsEntity product) {
    return favoritesRepo.AddFavorites(product);
  }
}

abstract class UseCases<Type, parameter> {
  Future<void> call(parameter p);
}
