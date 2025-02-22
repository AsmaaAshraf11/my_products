// features/component/text_divider.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
              child: Divider(thickness: 1, color: LightAppColors.graycolor600)),
          5.w.widthSizedBox,
          Text(
            'OR',
            style: TextStyle(fontSize: 14, color: LightAppColors.graycolor600),
          ),
          5.w.widthSizedBox,
          Expanded(
              child: Divider(thickness: 1, color: LightAppColors.graycolor600)),
        ],
      ),
    );
  }
}
