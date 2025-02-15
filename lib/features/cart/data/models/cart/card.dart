// features/home/data/models/card/card.dart
import 'cart.dart';

class Card {
  List<CartModel>? carts;
  int? total;
  int? skip;
  int? limit;

  Card({this.carts, this.total, this.skip, this.limit});

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        carts: (json['carts'] as List<dynamic>?)
            ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'carts': carts?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
