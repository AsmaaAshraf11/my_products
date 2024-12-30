// features/home/presentation/views/widgets/list_view_item_categories.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart';

class ListViewItemCategories extends StatefulWidget {
  const ListViewItemCategories({super.key});

  @override
  State<ListViewItemCategories> createState() => _ListViewItemCategoriesState();
}

class _ListViewItemCategoriesState extends State<ListViewItemCategories> {
  Color colotcontanr = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        listener: (BuildContext context, CategoryState state) {
      if (state is CategorySuccess) {
        print(state.Category);
      }
    }, builder: (BuildContext context, CategoryState state) {
      return GestureDetector(
        onTap: () {
          setState(() {
            colotcontanr = Colors.green.shade100;
          });
        },
        child: Container(
          width: 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colotcontanr,
            border: Border.all(color: Colors.grey.shade300),
            //  bottom: BorderSide()

            // color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: TitleMedium(
              text: 'fruit',
              textColor: LightAppColors.black,
              bold: true,
            )),
            Expanded(
              child: Image.asset(
                ImageAssets.imge1,
                width: 70.w,
              ),
            ),
          ]),
        ),
      );
    });
  }
}
