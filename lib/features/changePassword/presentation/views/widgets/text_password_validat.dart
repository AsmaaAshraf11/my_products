// features/login/presentation/views/widgets/text_password_validat.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_text.dart';

class TextPasswordValidat extends StatelessWidget {
  const TextPasswordValidat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeader(
          text: '• Password must have 8 characters',
          fontSize: 12,
        ),
        SmallHeader(
          text: '• numbers or special character,',
          fontSize: 12,
        ),
      ],
    );
  }
}
