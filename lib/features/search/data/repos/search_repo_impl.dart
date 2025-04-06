// features/search/data/repos/search_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/search/data/data_source/search_remote_data_source.dart';
import 'package:myproducts/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductsEntity>>> SearchProducts(
      String product) async {
    try {
      List<ProductsEntity> products = [];

      products = await searchRemoteDataSource.SearchProducts(product);
      return right(products);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
