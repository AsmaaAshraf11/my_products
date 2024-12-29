// features/home/presentation/views/product_detail_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailViewBody()
        );
  }
}