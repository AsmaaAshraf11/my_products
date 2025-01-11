// features/home/presentation/views/widgets/grid_view_popular.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_loading.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewPopular extends StatelessWidget {
  const GridViewPopular({super.key});
//ProductsEntity productsEntity
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
        listener: (BuildContext context, ProductsState state) {
      if (state is ProductsSuccess) {
        print(state.products.length);
      }
    }, builder: (BuildContext context, ProductsState state) {
      return Skeletonizer(
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
                              productsModel: state.products[index],
                            ),
                      )),
                )
              : state is ProductsFailure
                  ? CustomErrorWidget(errMessage: state.errMessage)
                  : ProductLoading());
    });
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
  }
}
