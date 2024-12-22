// features/signUp/presentation/views/sign_up_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/signUp/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpViewBody());
  }
}
