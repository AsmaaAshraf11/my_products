// features/home/data/repos/home_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/home/data/data_source/home_remote_data_source.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/domain/repos/hom_repo.dart';

class HomeRepoImpl implements HomRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<String>>> fetchCategory() async {
    try {
      List<String> categoryList = [];

      categoryList = await homeRemoteDataSource.fetchCategory();

      return right(categoryList);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> fetchProducts() async {
    // TODO: implement fetchNewsetBooks
    try {
      List<ProductsEntity> productsList = [];
      productsList = await homeRemoteDataSource.fetchProducts();
      return right(productsList);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> fetchCart() async {
    // TODO: implement fetchCart
    try {
      List<CartModel> ListCart = [];
      ListCart = await homeRemoteDataSource.fetchMyCart();
      return right(ListCart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
