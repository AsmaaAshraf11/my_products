// features/home/presentation/views/widgets/list_view_item_categories.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';

class ListViewItemCategories extends StatefulWidget {
  ListViewItemCategories({super.key, required this.category,required this.index});
  String category;
   int index;
 
  @override
  State<ListViewItemCategories> createState() => _ListViewItemCategoriesState();
}
  int select=0;

   
class _ListViewItemCategoriesState extends State<ListViewItemCategories> {
  Color colotcontanr = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {

        return GestureDetector(
          onTap: () {
             ProductsCubit.get(context).fetchProduct(category: widget.category);
                           colotcontanr = Colors.green.shade100;
                            select=widget.index;
            
          },
          child: Container(
            width: 120,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:select==widget.index? Colors.green.shade100 : Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              //  bottom: BorderSide()

              // color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: TitleMedium(
                    text: '${widget.category}',
                    textColor: LightAppColors.textcolor,
                    bold: true,
                  )),
                 
                ]),
          ),
        );
      },
    );
  }
}
