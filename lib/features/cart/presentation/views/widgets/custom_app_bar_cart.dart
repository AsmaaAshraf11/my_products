// features/cart/presentation/views/widgets/custom_app_bar_cart.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconbuttonArrowBack(
          route: Routes.layout,
          iconColor: Colors.white,
          padding: 20.0,
          buttonColor:
           LightAppColors.primary700,
          //Theme.of(context).
        ),
        Text(
          'My Cart',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconbuttonArrowBack(
          route: Routes.cart,
          iconColor: Colors.white,
          padding: 20.0,
          icon: Icons.notifications,
          buttonColor: LightAppColors.primary700,
        ),
      ],
    );
  }
}
