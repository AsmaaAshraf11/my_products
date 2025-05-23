// features/cart/data/models/amount/details.dart
class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details(
      {required this.subtotal,
      required this.shipping,
      required this.shippingDiscount});

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subtotal: json['subtotal'] as String?,
        shipping: json['shipping'] as String?,
        shippingDiscount: json['shipping_discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
}
