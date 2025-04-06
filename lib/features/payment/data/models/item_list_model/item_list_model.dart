// features/cart/data/models/item_list_model/item_list_model.dart
import 'item.dart';

class ItemListModel {
  final List<OrderItem> orders;

  ItemListModel({required this.orders});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        orders: (json['items'] as List<dynamic>)
            .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders.map((e) => e.toJson()).toList(),
      };
}
