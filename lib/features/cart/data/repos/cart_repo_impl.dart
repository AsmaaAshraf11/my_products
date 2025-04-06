// features/cart/data/repos/cart_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource cartLocalDataSource;

  CartRepoImpl({required this.cartLocalDataSource});

  @override
  Future<void> fetchAddCart(ProductsEntity product, int quant) async {
    var Cart = await cartLocalDataSource.fetchAddCart(product, quant);
  }

  @override
  Future<Either<Failure, List<CartModel>>> fetchCart() async {
    try {
      List<CartModel> ListCart = [];
      ListCart = await cartLocalDataSource.fetchMyCart();
      return right(ListCart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> DeletCart(int id) async {
    var data = await cartLocalDataSource.DeletCartCart(id: id);
  }

  @override
  Future<void> UpdatQuant(int id, int newquant) async {
    await cartLocalDataSource.fetchUpdateCart(id, newquant);
  }
}
