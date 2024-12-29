// features/home/presentation/views/widgets/grid_view_popular.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';

class GridViewPopular extends StatelessWidget {
  const GridViewPopular({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (BuildContext context, ProductsState state) {
        if (state is ProductsSuccess) {
           print(state.products.length);
        }
      },
      builder:(BuildContext context, ProductsState state) {
        if (state is ProductsSuccess){
        return 
         GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 27,
        mainAxisSpacing: 20,
        childAspectRatio: .9,
        children: List.generate(state.products.length, (index) => ProductItem(productsModel: state.products[index],)),
      );
        }else if (state is ProductsFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        textAlign: TextAlign.center,
      ),
    );
  }}