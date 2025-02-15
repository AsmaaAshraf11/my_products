// features/search/domain/use_cases/search_use_cases.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';
import 'package:myproducts/features/search/domain/repos/search_repo.dart';

class SearchUseCases extends UseCases<List<ProductsEntity>, String> {
  final SearchRepo searchRepo;

  SearchUseCases(this.searchRepo);

  @override
  Future<Either<Failure, List<ProductsEntity>>> call(String products) {
    return searchRepo.SearchProducts(products);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p);
}
