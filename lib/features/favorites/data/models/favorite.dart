// features/favorites/data/models/favorite.dart
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

class Favorite extends ProductsEntity {
  final int productId;
  final int id;

  final String Category;

  final String images;

  final String titleProduct;

  final String descriptionProduct;

  final num? price;

  final num? rating;

  Favorite(
      {required this.images,
      required this.titleProduct,
      required this.id,
      required this.descriptionProduct,
      required this.Category,
      required this.price,
      required this.rating,
      required this.productId})
      : super(
            image: images,
            titleProduct: titleProduct,
            descriptionProduct: descriptionProduct,
            Category: Category,
            price: price,
            rating: rating,
            productId: productId);

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        productId: json['idProduct'] as int,
        id: json['id'] as int,
        titleProduct: json['titleProduct'] as String? ?? '',
        descriptionProduct: json['description'] as String? ?? '',
        Category: json['category'] as String? ?? '',
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        images: json['images'] as String? ?? '',
      );

  //        factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
  //   productId: json['id'] as int,
  //   id: json['id'] as int,
  //   titleProduct: json['title'] as String,
  //   descriptionProduct: json['description'] as String,
  //   Category: json['category'] as String,
  //   price: (json['price'] as num?)?.toDouble(),
  //   rating: (json['rating'] as num?)!.toDouble(),
  //   images: json['images'] as String,
  // );

  //  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
  //   productId: json['id'] as int,
  //   id: json['id'] as int,
  //   titleProduct: json['titleProduct'] == null ? '' : json['titleProduct'],
  //   descriptionProduct: json['description'] == null ? '' : json['description'],
  //   Category: json['category'] == null ? '' : json['category'],
  //   price: (json['price'] as num?)?.toDouble(),
  //   rating: (json['rating'] as num?)!.toDouble(),
  //   images: json['images'] == null ? '' : json['images'],
  //   //json['token'] == null ? '' : json['token'],
  // );
}
