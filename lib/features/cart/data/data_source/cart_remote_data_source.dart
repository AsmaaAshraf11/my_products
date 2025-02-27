// features/cart/data/data_source/cart_remote_data_source.dart
// import 'package:myproducts/core/dio/api_service.dart';
// import 'package:myproducts/core/dio/end_points.dart';
// import 'package:myproducts/features/cart/data/models/cart/cart.dart';

// abstract class CartRemoteDataSource {
  
// Future<List<CartModl>> fetchMyCart();
//   Future<CartModl> fetchAddNewCart({required int id, required int quant});
//   Future<CartModl> DeletCartCart({required int id});
//   }

//  class CartRemoteDataSourceImpl extends CartRemoteDataSource {
//    final ApiService apiService;

//    CartRemoteDataSourceImpl(this.apiService);

// @override
//   Future<List<CartModl>> fetchMyCart() async {
//     var data =
//         await apiService.get(endpoint: Endpoint.getCrat);
//     List<CartModl> products = Listcart(data);
//     return products;
//   }

//   @override
//   Future<CartModl> fetchAddNewCart(
//       {required int id, required int quant}) async {
//     // TODO: implement fetchAddNewCart
//     var data = await apiService.post(
//         endpoint: Endpoint.getCrat,
//         isToken: true,
//         parameter: 'add',
//         data: {
//           'userId': 1,
//           'products': [
//             {'id': id, 'quantity': quant}
//           ]
//         });
//     CartModl newcart = CartModl.fromJson(data);
//     return newcart;
//   } 

//   @override
//   Future<CartModl> DeletCartCart({required int id}) async {
//     // TODO: implement DeletCartCart
//       var data = await apiService.delete(
//         endpoint:  Endpoint.getCrat,
//         parameter: '/$id',
//         );
//          CartModl products = CartModl.fromJson(data);
//     return products;
//   }
//    List<CartModl> Listcart(Map<String, dynamic> data) {
//     print('cart ');
//     List<CartModl> cart = [];
//     for (var Map in data['carts']) {
//       cart.add(CartModl.fromJson(Map));
//     }
//     return cart;
//   }

 
//  }
