// features/favorites/data/repos/favorites_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/favorites/data/data_source/favorites_local_data_source.dart';
import 'package:myproducts/features/favorites/domain/repos/favorites_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesLocalDataSourceImpl favoritesLocalDataSourceImpl;

  FavoritesRepoImpl({required this.favoritesLocalDataSourceImpl});

  @override
  Future<void> AddFavorites(ProductsEntity product) async {
    favoritesLocalDataSourceImpl.addFavorite(product);
    //return data;
  }

  @override
  Future<void> deleteFavorites(int id) async {
    favoritesLocalDataSourceImpl.deleteFavorites(id);
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getFavorites() async {
    try {
      var data = await favoritesLocalDataSourceImpl.getFavorites();
      return right(data);
    } on Failure catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
