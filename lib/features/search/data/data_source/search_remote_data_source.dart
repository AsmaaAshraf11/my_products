// features/search/data/data_source/search_remote_data_source.dart
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

abstract class SearchRemoteDataSource {
  
 Future<List<ProductsEntity>> SearchProducts(String product);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

      @override
      Future<List<ProductsEntity>> SearchProducts(String product)async{
    // TODO: implement SearchProducts
var data = await apiService.get(
        parameter: 'search?q=$product',
        endpoint: Endpoint.getCategories);
    List<ProductsEntity> products = productsList(data);
    print(products.length);
    return products;      
    }
    List<ProductsEntity> productsList(Map<String, dynamic> data) {
    List<ProductsEntity> products = [];
    for (var Map in data['products']) {
      products.add(Product.fromJson(Map));
    }
    return products;
    }
}
