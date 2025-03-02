// features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/cart/data/models/cart/cart.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/cart/domain/use_cases/fetchMyCart_use_case.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.fetchmycartUseCase) : super(CartInitial());
     static CartCubit get(context) => BlocProvider.of(context);

  final FetchmycartUseCase fetchmycartUseCase;

  List<CartModel> cartList = [];
  List<int>idproduct=[];
  Future<void> fetchCart() async {
         emit(CartLoading());
    var result = await fetchmycartUseCase.call();
    result.fold((failure) {
      emit(CartFailure(failure.errorMessage));
      print('error5 :${failure.errorMessage}');
    }, (cart) {
      cartList = cart;
      emit(CartSuccess(cart));
      cartList = cart;
      cartList.forEach((product) {
  idproduct.add(product.productId);
  
});
      
      print('yes cart');
    });
  }
  Future<void> fetAddchCart(ProductsEntity product, int quant) async {
    emit(AddCartLoading());

    
    try{
          var result = await fetchmycartUseCase.callAdd(product, quant);
          idproduct.add(product.productId);
           emit(AddCartSuccess());
           
                
    }catch(erorr) {
          print(' error when add${erorr.toString()}');
          emit(AddCartFailure(erorr.toString()));
        };
    
  }
  Future<void> fetchDeleteCart(int id,) async {
    emit(CartLoading());

    
    try{
         var result = await fetchmycartUseCase.Call(id,);

          print(' delete');
           emit(DeleteCartSuccess());

    }catch(erorr) {
          print(' error delet${erorr.toString()}');
          emit(DeleteCartFailure(erorr.toString()));
        };
  }
  // todo  remove cart
  Future<void> removeCart({required int index,required int id}) async {
        fetchDeleteCart(id);
    cartList.removeAt(index);
    emit(UpdateCartSuccess(''));
  }


  Future<void> fetchApdatCart(int id, int quant) async {

    
    try{
          var result = await fetchmycartUseCase.callUpdat(id, quant);
           fetchCart();
           emit(ApdatCartSuccess());
          
                
    }catch(erorr) {
          print(' error when add${erorr.toString()}');
        };
    
  }

  

}
