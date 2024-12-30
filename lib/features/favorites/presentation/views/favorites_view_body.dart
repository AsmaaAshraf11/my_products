// features/favorites/presentation/views/favorites_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';

class FavoritesViewBody extends StatelessWidget {
  var Searchcontroller = TextEditingController();

  FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridViewPopular(),
      ],
    );
  }
}
