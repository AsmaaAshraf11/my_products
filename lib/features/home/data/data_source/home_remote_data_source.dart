// features/home/data/data_source/home_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchCategory();
  Future<List<ProductsEntity>> fetchProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<String>> fetchCategory() async {
    List<String> category = [];
    var data = await apiService.get(
        endpoint: Endpoint.getCategories, endPoint: 'category-list');
    category = categoryList(data);
    return category;
  }

  @override
  Future<List<ProductsEntity>> fetchProducts() async {
    var data = await apiService.get(
        endPoint: 'category/smaones', endpoint: Endpoint.getproduct);
    List<ProductsEntity> products = productsList(data);
    return products;
  }

  List<ProductsEntity> productsList(Map<String, dynamic> data) {
    //print('products ');
    List<ProductsEntity> products = [];
    for (var bookMap in data['products']) {
      products.add(Product.fromJson(bookMap));
    }
   // print('products :$products');
    return products;
  }

  List<String> categoryList(data) {
    List<String> products = [];
    for (var bookMap in data) {
      products.add(bookMap);
    }
    return products;
  }
}