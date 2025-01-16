// features/home/data/data_source/home_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchCategory();
  Future<List<ProductsEntity>> fetchProducts();
  Future<ProductsEntity> fetchDetailProducts({required int id});
  Future<List<CartModel>> fetchMyCart();
  Future<CartModel> fetchAddNewCart({required int id, required int quant});
  Future<LoginModel> fetchDataLogin({required String name, required String password});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<String>> fetchCategory() async {
    // TODO: implement fetchCategory
    List<String> category = [];
    var data = await apiService.get2(
        parameter: 'category-list',
        endpoint: Endpoint.getCategories,
        endPoint: 'category-list');
    //data.map((json) => Categorymodel.fromJson(json)).toList();
    category = categoryList(data);
    // print('categoryList : $category');
    return category;
  }

  @override
  Future<List<ProductsEntity>> fetchProducts() async {
    var data = await apiService.get(
        parameter: 'smartphones',
        endPoint: 'category/smaones',
        endpoint: Endpoint.getproduct);
    List<ProductsEntity> products = productsList(data);
    return products;
  }

  @override
  Future<List<CartModel>> fetchMyCart() async {
    var data =
        await apiService.get(endPoint: 'cart', endpoint: Endpoint.getCrat);
    List<CartModel> products = Listcart(data);
    return products;
  }

  @override
  Future<ProductsEntity> fetchDetailProducts({required int id}) async {
    // TODO: implement fetchDetailProducts
    print('detail');
    var data = await apiService.get(
        parameter: '$id',
        endPoint: 'detail',
        endpoint: Endpoint.getDetailproduct);

    ProductsEntity? products;
    products = Product.fromJson(data);
    return products;
  }

  @override
  Future<CartModel> fetchAddNewCart(
      {required int id, required int quant}) async {
    // TODO: implement fetchAddNewCart
    var data = await apiService.post(
        endpoint: Endpoint.getCrat,
        isToken: true,
        parameter: 'add',
        data: {
          'userId': 1,
          'products': [
            {'id': id, 'quantity': quant}
          ]
        });
    CartModel newcart = CartModel.fromJson(data);
    return newcart;
  } 
   @override
  Future<LoginModel> fetchDataLogin({required String name, required String password})async {
    // TODO: implement fetchDataLogin
 var data = await apiService.post(
        endpoint: Endpoint.login,
        isToken: true,
        parameter: 'login',
        data: {
          'username': name,
          'password':password ,
        });
    LoginModel datalogin = LoginModel.fromJson(data);
    return datalogin;  }

  List<CartModel> Listcart(Map<String, dynamic> data) {
    print('cart ');
    List<CartModel> cart = [];
    for (var Map in data['carts']) {
      cart.add(CartModel.fromJson(Map));
    }
    return cart;
  }

  List<ProductsEntity> productsList(Map<String, dynamic> data) {
    //print('products ');
    List<ProductsEntity> products = [];
    for (var Map in data['products']) {
      products.add(Product.fromJson(Map));
    }
    // print('products :$products');
    return products;
  }

  List<String> categoryList(data) {
    List<String> category = [];
    for (var Map in data) {
      category.add(Map);
    }
    return category;
  }
  
  
  
 
}
