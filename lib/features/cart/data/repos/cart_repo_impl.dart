// features/cart/data/repos/cart_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:myproducts/features/cart/domain/repos/cart_repo.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({required this.cartRemoteDataSource});
   @override
  Future<Either<Failure, List<CartModel>>> fetchCart() async {
    // TODO: implement fetchCart
    try {
      List<CartModel> ListCart = [];
      ListCart = await cartRemoteDataSource.fetchMyCart();
      return right(ListCart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> fetchAddNewCart(int id, int quant) async {
    // TODO: implement fetchAddNewCart
    try {
      CartModel newCart;
      newCart =
          await cartRemoteDataSource.fetchAddNewCart(id: id, quant: quant);
      return right(newCart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,CartModel>> DeletCart(int id) async{
    // TODO: implement DeletCart
    try {
      CartModel Cart ;
      Cart = await cartRemoteDataSource.DeletCartCart(id: id);
      return right(Cart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}