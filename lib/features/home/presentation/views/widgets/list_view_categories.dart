// features/home/presentation/views/widgets/list_view_categories.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_item_categories.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewCategories extends StatefulWidget {
  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}
class _ListViewCategoriesState extends State<ListViewCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategorySuccess) {
          //print(state.Category);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is CategoryLoading,
          child: state is CategorySuccess
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) 
                      {
                        return ListViewItemCategories(
                            category: '${state.Category[index]}', index: index,
                           // category=
                          );
                          
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: state.Category.length),
                )
              : state is CategoryFailure
                  ? CustomErrorWidget(errMessage: state.errMessage)
                  : GestureDetector(
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          //  bottom: BorderSide()

                          // color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('category'),
                      ),
                    ),
        );
      },
    );
  }
}
