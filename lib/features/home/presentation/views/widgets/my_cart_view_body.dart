// features/home/presentation/views/widgets/my_cart_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_cart_cubit/cubit/cart_cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_app_bar_cart.dart';
import 'package:myproducts/features/home/presentation/views/widgets/delet_item_cart.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/my_cart_item.dart';
import 'package:myproducts/features/login/presentation/views/widgets/button.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  List item = [1, 2, 3, 4, 5];
  int length = 5;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess )
         print(state.cart.length);
        
      }, 
      builder: (context, state) {
        return Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              CustomAppBarCart(),
              30.h.heightSizedBox,
              if(state is CartSuccess)
                
              Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.5,
                      child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: state.cart.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              onDismissed: (direction) {
                                setState(() {
                                  if(index <state.cart[index].products!.length)
                                  state.cart[index].products!.remove(index);
                                });
                              },
                              background: DeletItemCart(),
                              key: ValueKey(state.cart[index].products! ),
                              child: MyCartItem( model: state.cart[index].products![index]),
                            );
                          }),
                    ),
                    Container(
                  decoration: BoxDecoration(
                    color: LightAppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.all(34),
                  height: context.screenHeight * .367,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleMedium(
                            text: 'Shopping cost',
                            textColor: LightAppColors.graycolor600,
                            fontSize: 18,
                          ),
                          TitleMedium(
                            bold: true,
                            text: '${'\$27.99'}',
                            textColor: LightAppColors.black,
                          )
                        ],
                      ),
                      15.h.heightSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleMedium(
                            text: 'Delivery cost',
                            textColor: LightAppColors.graycolor600,
                            fontSize: 18,
                          ),
                          TitleMedium(
                            bold: true,
                            text: '${'\$12.99'}',
                            textColor: LightAppColors.black,
                          )
                        ],
                      ),
                      15.h.heightSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadLine22(
                            text: 'Total cost',
                          ),
                          HeadLine22(
                            text: '${'\$40.99'}',
                            textColor: LightAppColors.black,
                          )
                        ],
                      ),
                      25.h.heightSizedBox,
                      defaultButton(
                        onPressed: () {},
                        text: 'Checkout',
                      ),
                    ], ),
                ),
                  ],),
                 if(state is CartLoading)
                    Center(
      child: CircularProgressIndicator(),
                    ),
                     if(state is CartFailure)
                  CustomErrorWidget(errMessage: state.errMessage),
            ],
          ),
        );
      },
    );
  }
}
