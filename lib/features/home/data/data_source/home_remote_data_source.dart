// features/home/data/data_source/home_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/home/data/models/cart/cart.dart';
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchCategory();
  Future<List<ProductsEntity>> fetchProducts();
  Future<ProductsEntity> fetchDetailProducts({required int id});
  Future<List<CartModel>> fetchMyCart();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<String>> fetchCategory() async {
    List<String> category = [];
    var data = await apiService.get2(
        endpoint: Endpoint.getCategories, endPoint: 'category-list');
    category = categoryList(data);
    print('categoryList : $category');
    return category;
  }

  @override
  Future<List<ProductsEntity>> fetchProducts() async {
    var data = await apiService.get(
        endPoint: 'category/smaones', endpoint: Endpoint.getproduct);
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
  
  
  @override
  Future<ProductsEntity> fetchDetailProducts({required int id})async {
    // TODO: implement fetchDetailProducts
    print('detail');
var data = await apiService.get(
  parameter:'$id' ,
        endPoint: 'detail', endpoint: Endpoint.getDetailproduct);
        
        
   // ProductsEntity products = data as ProductsEntity;
     ProductsEntity? products;
   // for (var Map in data['products']) {
   products=   Product.fromJson(data);
  //  }
    return products;
      }
}
