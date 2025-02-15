// features/search/domain/repos/search_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

import '../../../../core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductsEntity>>> SearchProducts(String products);
}
