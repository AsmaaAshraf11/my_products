// features/home/presentation/views/widgets/list_view_categories.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_item_categories.dart';

class ListViewCategories extends StatefulWidget {
  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ListViewItemCategories(),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: 5),
    );

    // SizedBox(
    //   height: MediaQuery.of(context).size.height * .1,
    //   child: ListView.builder(
    //     physics: const BouncingScrollPhysics(),
    //     itemCount: 5,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return
    //     }
    //   ),
    // );
  }
}
