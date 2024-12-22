// features/login/presentation/views/change_password_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/login/presentation/views/widgets/change_password_view_body.dart';

class ChangePaswordView extends StatelessWidget {
  const ChangePaswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangePasswordViewBody(),
    );
  }
}
