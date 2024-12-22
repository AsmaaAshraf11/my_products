// features/login/presentation/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/login/presentation/views/widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginViewBody());
  }
}
