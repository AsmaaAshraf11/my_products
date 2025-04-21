// features/home/presentation/views/product_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart';
import 'package:myproducts/features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/counter_detail.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';
import 'package:myproducts/features/home/presentation/views/widgets/description_product.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/mid_buttom.dart';
import 'package:myproducts/features/home/presentation/views/widgets/myclipper.dart';
import 'package:myproducts/features/home/presentation/views/widgets/review_and_rating.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // preferredSize: Size.fromHeight(70),
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: LightAppColors.green300!.withOpacity(0.6),
          ),
        ),
      ),
       backgroundColor: Theme.of(context).canvasColor,

      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddCartSuccess) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              desc: 'Successfully added ',
              descTextStyle:  TextStyle(fontSize: 18,color: Theme.of(context).focusColor,),
            ).show();
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return BlocBuilder<CartCubit, CartState>(
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
                              height: 315,
                              color: LightAppColors.green300?.withOpacity(0.6),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconbuttonArrowBack(
                                      route: Routes.layout,
                                      iconColor: Colors.white,
                                      padding: 20.0,
                                      buttonColor: LightAppColors.primary700,
                                    ),
                                    IconbuttonArrowBack(
                                       route: Routes.detail,
                                       arguments:state.products.productId ,
                                      iconColor: Colors.white,
                                      padding: 20.0,
                                      icon: Icons.favorite,
                                      buttonColor: LightAppColors.primary700,
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
                                      imageUrl: state.products.image ?? ''),
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
                          numReview: state.products.image!.length,
                          rating: state.products.rating,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              DescriptionProduct(
                                description:
                                    '${state.products.descriptionProduct}',
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MidButtom(
                                      text: '\$${state.products.price}',
                                      onPressed: () {},
                                    ),
                                    MidButtom(
                                      text: 'Add Cart',
                                      onPressed: () {
                                        if (CartCubit.get(context)
                                            .idproduct
                                            .contains(
                                                state.products.productId)) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.rightSlide,
                                            desc: ' it already exists  ',
                                            descTextStyle:
                                                 TextStyle(fontSize: 18,color:  Theme.of(context).focusColor),
                                          ).show();
                                        } else {
                                          CartCubit.get(context).fetAddchCart(
                                              state.products, number);
                                        }
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
          );
        },
      ),
    );
  }
}
