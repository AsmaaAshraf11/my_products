// features/cart/presentation/views/widgets/list_view_payment.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_item_categories.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewPayment extends StatefulWidget {
  @override
  State<ListViewPayment> createState() => _ListViewPaymentState();
}
class _ListViewPaymentState extends State<ListViewPayment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) 
                    {
                     // return
                      // ListViewItemCategories(
                       //   category: '${state.Category[index]}', index: index,
                         // category=
                       // );
                        
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 4),
              );
  }
}
