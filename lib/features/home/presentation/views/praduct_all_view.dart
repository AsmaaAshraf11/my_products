// features/home/presentation/views/praduct_all_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_categories.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_item_categories.dart';
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
       appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.white,
          )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30
                ),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconbuttonArrowBack(
                          route: Routes.layout,
                          iconColor: Colors.white,
                          padding: 20.0,
                          buttonColor:
                           LightAppColors.primary700,
                          //Theme.of(context).
                        ),
                       
                        IconbuttonArrowBack(
                          route: Routes.layout,
                          iconColor: Colors.white,
                          padding: 20.0,
                          icon: Icons.home_filled,
                          buttonColor: LightAppColors.primary700,
                        ),
                      ],
                    ),
              ),
              HeadLine22(text: '$category',),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20
                ),
                child: Skeletonizer(
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
              ),
            ],
          ),
        ),
      );
    });;
  }
}