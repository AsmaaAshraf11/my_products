// features/cart/presentation/manger/featured_new_cart/cubit/add_cart_cubit.dart
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:myproducts/features/cart/data/models/cart/cart.dart';
// import 'package:myproducts/features/cart/domain/use_cases/fetchAddCart_use_case.dart';
// import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

// part 'add_cart_state.dart';

// class AddCartCubit extends Cubit<AddCartState> {
//   AddCartCubit(this.fetchaddcartUseCase) : super(AddCartInitial());
//   static AddCartCubit get(context) => BlocProvider.of(context);

//   final FetchaddcartUseCase fetchaddcartUseCase;
//   Future<void> fetAddchCart(ProductsEntity product, int quant) async {
//     emit(AddCartLoading());

    
//     try{
//           var result = await fetchaddcartUseCase.call(product, quant);
//            emit(AddCartSuccess());
           
                
//     }catch(erorr) {
//           print(' error when add${erorr.toString()}');
//           emit(AddCartFailure(erorr.toString()));
//         };
    
//   }
// }
