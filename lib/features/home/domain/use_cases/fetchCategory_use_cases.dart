// features/home/domain/use_cases/fetchCategory_use_cases.dart

import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchcategoryUseCases {
  final HomRepo homeRepo;

  FetchcategoryUseCases(this.homeRepo);

  Future<Either<Failure, List<String>>> call() async {
    return await homeRepo.fetchCategory();
  }
}
