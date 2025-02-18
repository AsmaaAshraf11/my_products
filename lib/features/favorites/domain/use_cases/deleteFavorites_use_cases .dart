// features/favorites/domain/use_cases/deleteFavorites_use_cases .dart
import 'package:myproducts/features/favorites/domain/repos/favorites_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class DeletefavoritesUseCases  {
  final FavoritesRepo favoritesRepo;

  DeletefavoritesUseCases(this.favoritesRepo);

  @override
  Future<void> call( int id) {
    return favoritesRepo.deleteFavorites(id);
  }
}

abstract class UseCases<Type, parameter> {
  Future<void> call(parameter p);
}
