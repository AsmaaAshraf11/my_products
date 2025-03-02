// features/cart/domain/repos/cart_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class CartRepo {
  
  Future<Either<Failure, List<CartModel>>> fetchCart();
  Future<void> fetchAddCart(ProductsEntity product,int quant);
  Future<void> DeletCart(int id, );
  Future<void> UpdatQuant(int id,int newquant ); 
}