// features/home/domain/entities/Products_Entity.dart

class ProductsEntity {
  final int? productId;

  final String? Category;

  final List<String>? images;

  final String? titleProduct;

  final String? descriptionProduct;

  final num? price;

  final num? rating;

  ProductsEntity(
      {required this.images,
      required this.titleProduct,
      required this.descriptionProduct,
      required this.Category,
      required this.price,
      required this.rating,
      required this.productId});
}
