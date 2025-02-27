// features/cart/data/models/cart_model.dart
class CartModel {
  int productId;
  String? title;
  double price;
  int quantity;
  String? image;

  CartModel({
    required this.productId,
    this.title,
    required this.price,
    required this.quantity,
    this.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productId: json['productId'] as int,
        title: json['title'] as String?,
        price: (json['price'] as num?)!.toDouble(),
        quantity: json['quantity'] as int,
        image: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'title': title,
        'price': price,
        'quantity': quantity,
        'thumbnail': image,
      };
}
