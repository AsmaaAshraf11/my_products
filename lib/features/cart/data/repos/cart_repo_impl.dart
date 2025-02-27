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
  //  @override
  // Future<Either<Failure, List<CartModl>>> fetchCart() async {
  //   // TODO: implement fetchCart
  //   try {
  //     List<CartModl> ListCart = [];
  //     ListCart = await cartRemoteDataSource.fetchMyCart();
  //     return right(ListCart);
  //   } on Exception catch (e) {
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, CartModl>> fetchAddNewCart(int id, int quant) async {
  //   // TODO: implement fetchAddNewCart
  //   try {
  //     CartModl newCart;
  //     newCart =
  //         await cartRemoteDataSource.fetchAddNewCart(id: id, quant: quant);
  //     return right(newCart);
  //   } on Exception catch (e) {
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure,CartModl>> DeletCart(int id) async{
  //   // TODO: implement DeletCart
  //   try {
  //     CartModl Cart ;
  //     Cart = await cartRemoteDataSource.DeletCartCart(id: id);
  //     return right(Cart);
  //   } on Exception catch (e) {
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<void> fetchAddCart(ProductsEntity product, int quant)async {
    // TODO: implement fetchAddCart
var Cart =
          await cartLocalDataSource.fetchAddCart(product, quant);
    }

  @override
  Future<Either<Failure, List<CartModel>>> fetchCart()async {
    // TODO: implement fetchCart
try {
      List<CartModel> ListCart = [];
      ListCart = await cartLocalDataSource.fetchMyCart();
      return right(ListCart);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    } 
     }
     
       @override
       Future<void> DeletCart(int id)async {
      var data=  await cartLocalDataSource.DeletCartCart(id: id);
       }

}