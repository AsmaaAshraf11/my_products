// features/home/data/data_source/home_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchCategory();
  Future<List<ProductsEntity>> fetchProducts(String category);
  Future<ProductsEntity> fetchDetailProducts({required int id});
  
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
    );
    //data.map((json) => Categorymodel.fromJson(json)).toList();
    category = categoryList(data);
    // print('categoryList : $category');
    return category;
  }

  @override
  Future<List<ProductsEntity>> fetchProducts(String category) async {
    var data = await apiService.get(
        parameter: '$category',
        endpoint: Endpoint.getproduct);
    List<ProductsEntity> products = productsList(data);
    return products;
  }

  

  @override
  Future<ProductsEntity> fetchDetailProducts({required int id}) async {
    // TODO: implement fetchDetailProducts
    print('detail');
    var data = await apiService.get(
        parameter: '$id',
        endpoint: Endpoint.getDetailproduct);

    ProductsEntity? products;
    products = Product.fromJson(data);
    return products;
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
