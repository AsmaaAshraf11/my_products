// features/home/domain/entities/Products_Entity.dart

import 'package:myproducts/features/home/data/models/products/review.dart';

class ProductsEntity {
  final int productId;

  final String? Category;

  final List<String>? images;

  final String titleProduct;

  final String? descriptionProduct;

  final num? price;

  final num? rating;
  final List <Review> review;

  ProductsEntity(
      {required this.images,
      required this.titleProduct,
      required this.descriptionProduct,
      required this.Category,
      required this.price,
      required this.rating,
      required this.review,
      required this.productId});
}
