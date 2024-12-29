// features/home/presentation/views/my_cart_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/home/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCartViewBody());
  }
}