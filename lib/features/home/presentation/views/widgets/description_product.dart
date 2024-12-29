// features/home/presentation/views/widgets/description_product.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class DescriptionProduct extends StatelessWidget {
  const DescriptionProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: 'Product Description',),
        Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10
                                      ),
                                      child: TitleText(textColor: LightAppColors.graycolor600,fontWeight: FontWeight.normal,
                                        text: 'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.'),
                                    ),
      ],
    );
                                    
  }
}