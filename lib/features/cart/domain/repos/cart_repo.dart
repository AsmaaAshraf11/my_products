// features/cart/domain/repos/cart_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';

abstract class CartRepo {
  
  Future<Either<Failure, List<CartModel>>> fetchCart();
  Future<Either<Failure, CartModel>> fetchAddNewCart(int id, int quant); 
  Future<Either<Failure, CartModel>> DeletCart(int id, ); 
}