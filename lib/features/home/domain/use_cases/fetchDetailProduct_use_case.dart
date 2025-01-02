// features/home/domain/use_cases/fetchDetailProduct_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class FetchdetailproductUseCase extends  UseCases<ProductsEntity, int> {
    final HomRepo homRepo;

  FetchdetailproductUseCase( this.homRepo);
  
  @override
  Future<Either<Failure, ProductsEntity>> call(int p)async {
    // TODO: implement call
         return await homRepo.fetchDetailProducts( p);  }
  
  // @override
  // Future<Either<Failure, ProductsEntity>> call(int p) async{
  //   // TODO: implement call
  // return await homRepo.fetchDetailProducts(id: p);
  //   }


  // @override
  //  Future<Either<Failure, ProductsEntity>> call(int p)async {
  //   return await homRepo.fetchDetailProducts(id: p);
  // }
 
}
abstract class UseCases<Type, parameter> {
  Future<Either<Failure, Type>> call(parameter p);
}