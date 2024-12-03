// features/login/presentation/views/forget_Password_viewdart.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/login/presentation/views/widgets/forget_Password_body.dart';

class ForgetPasswordViewdart extends StatelessWidget {
  const ForgetPasswordViewdart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ForgetPasswordBody());
  }
}