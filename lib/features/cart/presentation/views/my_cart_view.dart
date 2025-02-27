// features/cart/presentation/views/my_cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/cart/data/repos/cart_repo_impl.dart';
import 'package:myproducts/features/cart/domain/use_cases/fetchMyCart_use_case.dart';
import 'package:myproducts/features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart';
import 'package:myproducts/features/cart/presentation/manger/featured_DeleteCart_cubit/cubit/delete_cart_cubit.dart';
import 'package:myproducts/features/cart/presentation/views/widgets/custom_app_bar_cart.dart';
import 'package:myproducts/features/cart/presentation/views/widgets/delet_item_cart.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/cart/presentation/views/widgets/my_cart_item.dart';
import 'package:myproducts/features/component/button.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}


class _MyCartViewState extends State<MyCartView> {
  double costDel=12.99;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: AppBar(
            backgroundColor: Colors.grey.shade100,
          )),
      body: Column(
        children: [
          CustomAppBarCart(),
          30.h.heightSizedBox,
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              List<CartModel> cart =
                  BlocProvider.of<CartCubit>(context).cartList;
              return Container(
                  color: Colors.grey.shade100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.46,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: cart.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                onDismissed: (direction) {
                                  //  CartCubit .get(context).fetchDeleteCart(cart[index].productId,);
                                    BlocProvider.of<CartCubit>(context)
                                        .removeCart(index: index, id: cart[index].productId,);
                                },
                                background: DeletItemCart(),
                                key: ValueKey(cart[index]),
                                child: MyCartItem(model: cart[index]),
                              );
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        padding: EdgeInsets.all(34),
                        height: context.screenHeight * .367,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                               
                                TitleMedium(
                                  text: 'Shopping cost',
                                  textColor: LightAppColors.graycolor600,
                                  fontSize: 18,
                                ),
                                TitleMedium(
                                  bold: true,
                                  text: '${'\$'+' {totat},'}',
                                  textColor: Theme.of(context).focusColor,
                                )
                              ],
                            ),
                            15.h.heightSizedBox,
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                TitleMedium(
                                  text: 'Delivery cost',
                                  textColor: LightAppColors.graycolor600,
                                  fontSize: 18,
                                ),
                                TitleMedium(
                                  bold: true,
                                  text: '${'\$'+'$costDel'}',
                                  textColor: Theme.of(context).focusColor,
                                )
                              ],
                            ),
                            15.h.heightSizedBox,
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const HeadLine22(
                                  text: 'Total cost',
                                ),
                                HeadLine22(
                                  text: '${'\$'+'40.99'}',
                                  textColor: Theme.of(context).focusColor,
                                )
                              ],
                            ),
                            25.h.heightSizedBox,
                            defaultButton(
                              onPressed: () {},
                              text: 'Checkout',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
