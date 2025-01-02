// features/home/presentation/views/widgets/list_view_item_categories.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class ListViewItemCategories extends StatefulWidget {
   ListViewItemCategories({super.key,required this.category});
  String category;

  @override
  State<ListViewItemCategories> createState() => _ListViewItemCategoriesState();
}

class _ListViewItemCategoriesState extends State<ListViewItemCategories> {
  Color colotcontanr = Colors.white;
  @override
  Widget build(BuildContext context) {
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
            text: '${widget.category}',
            textColor: LightAppColors.black,
            bold: true,
          )),
          // Expanded(
          //   child: Image.asset(
          //     ImageAssets.imge1,
          //     width: 70.w,
          //   ),
          // ),
        ]),
      ),
    );
  }
}
