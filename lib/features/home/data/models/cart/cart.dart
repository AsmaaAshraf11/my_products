// features/home/data/models/card/cart.dart
import 'product.dart';

class CartModel {
  int? id;
  List<Product>? products;
  double total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  CartModel({
    this.id,
    this.products,
    required this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: (json['total'] as num?)!.toDouble(),
        discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
        userId: json['userId'] as int?,
        totalProducts: json['totalProducts'] as int?,
        totalQuantity: json['totalQuantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };
}