// features/home/presentation/views/product_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart';
import 'package:myproducts/features/home/presentation/manger/featured_new_cart/cubit/new_cart_cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/counter_detail.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';
import 'package:myproducts/features/home/presentation/views/widgets/description_product.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/mid_buttom.dart';
import 'package:myproducts/features/home/presentation/views/widgets/myclipper.dart';
import 'package:myproducts/features/home/presentation/views/widgets/review_and_rating.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  BlocBuilder<NewCartCubit, NewCartState>(
      builder: (context, state) {
        return BlocConsumer<DatailproductCubit, DatailproductState>(
          listener: (context, state) {
            if (state is DatailSuccess) print(state.products.price);
            //print(model.titleProduct);
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is DatailSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: 320,
                        color: LightAppColors.green300?.withOpacity(0.6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconbuttonArrowBack(
                                route: Routes.layout,
                                iconColor: Colors.white,
                                padding: 20.0,
                                buttonColor: LightAppColors.maincolorgreen700,
                              ),
                              IconbuttonArrowBack(
                                iconColor: Colors.white,
                                padding: 20.0,
                                icon: Icons.favorite,
                                buttonColor: LightAppColors.maincolorgreen700,
                              )
                            ],
                          ),
                          // Image.asset(
                          //   ImageAssets.imge1,
                          //   // height: 180,
                          //   width: 180,
                          // ),
                          SizedBox(
                            height: 160,
                            child: CustomProductImage(
                                imageUrl: state.products.images![1] ?? ''),
                          ),
                        ],
                      ),
                    ),
                    CounterDetail()
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                        child: HeadLine22(
                      text: '${state.products.titleProduct}',
                      // text: 'Powder Canister',
                    )),
                  ),
                  ReviewAndRating(
                    numReview: state.products.images!.length,
                    rating: state.products.rating,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        DescriptionProduct(
                          description: '${state.products.descriptionProduct}',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MidButtom(
                                text: '\$${state.products.price}',
                                onPressed: () {},
                              ),
                              MidButtom(
                                text: 'Add Cart',
                                onPressed: () {
                                  NewCartCubit.get(context).fetchNewCart(
                                      state.products.productId, 2);
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (state is DatailFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    ),
    );
  }
}
