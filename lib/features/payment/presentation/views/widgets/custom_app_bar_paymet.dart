// features/payment/presentation/views/widgets/custom_app_bar_paymet.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';

class CustomAppBarPaymet extends StatelessWidget {
  const CustomAppBarPaymet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconbuttonArrowBack(
            route: Routes.cart,
            iconColor: Colors.white,
            padding: 20.0,
            buttonColor: LightAppColors.primary700,
            //Theme.of(context).
          ),
          Text(
            'Payment',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).focusColor,
            ),
          ),
          IconbuttonArrowBack(
            //  route: Routes.cart,
            iconColor: Colors.white,
            padding: 20.0,
            icon: Icons.qr_code,
            buttonColor: LightAppColors.primary700,
          ),
        ],
      ),
    );
  }
}
