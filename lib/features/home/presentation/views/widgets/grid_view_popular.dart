// features/home/presentation/views/widgets/grid_view_popular.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';

class GridViewPopular extends StatelessWidget {
  const GridViewPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 27,
      mainAxisSpacing: 20,
      childAspectRatio: .9,
      children: List.generate(4, (index) => ProductItem()),
    );
  }
}
