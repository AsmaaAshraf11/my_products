// features/home/presentation/views/praduct_all_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_loading.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PraductAllView extends StatelessWidget {
  const PraductAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
        listener: (BuildContext context, ProductsState state) {
      if (state is ProductsSuccess) {
      }
    }, builder: (BuildContext context, ProductsState state) {
      return Scaffold(
        appBar: AppBar(
          
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Skeletonizer(
                  enabled: state is ProductsLoading,
                  child: state is ProductsSuccess
                      ? GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 27,
                          mainAxisSpacing: 20,
                          childAspectRatio: .86,
                          children: List.generate(
                              state.products.length,
                              (index) => SizedBox(
                              //  height:context.screenHeight*0.4,
                                child: ProductItem(
                                      productsModel: state. products[index],
                                    ),
                              )),
                        )
                      : state is ProductsFailure
                          ? CustomErrorWidget(errMessage: state.errMessage)
                          : ProductLoading()),
            ],
          ),
        ),
      );
    });;
  }
}