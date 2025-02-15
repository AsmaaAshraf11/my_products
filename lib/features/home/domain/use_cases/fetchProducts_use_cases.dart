// features/home/domain/use_cases/fetchProducts_use_cases.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchproductsUseCases extends UseCases<List<ProductsEntity>, String> {
  final HomRepo homRepo;

  FetchproductsUseCases(this.homRepo);

  @override
  Future<Either<Failure, List<ProductsEntity>>> call([String? category]) {
    return homRepo.fetchProducts(category!);
  }
}

abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call([parameter p]);
}
