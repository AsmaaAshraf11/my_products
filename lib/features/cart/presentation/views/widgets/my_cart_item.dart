// features/cart/presentation/views/widgets/my_cart_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';

class MyCartItem extends StatefulWidget {
  MyCartItem({super.key, required this.model});
  CartModel model;
  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

double total = 0;

class _MyCartItemState extends State<MyCartItem> {
  int? quantity;
// double sum(int quant, double price) {
//     total += price * quant;

//     return total;
//   }

  @override
  void initState() {
    super.initState();
    quantity = widget.model.quantity;
    // sum(quantity!, widget.model.price);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
              padding: const EdgeInsets.all(9),
              height: context.screenHeight * 0.18,
              decoration: BoxDecoration(
                  color: LightAppColors.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: CustomProductImage(imageUrl: widget.model.image!),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 180,
                        child: HeadLine22(
                          text: '${widget.model.title}',
                          bold: false,
                          overflow: true,
                        ),
                      ),
                      10.h.heightSizedBox,
                      Row(
                        children: [
                          HeadLine22(
                            text: '\$${widget.model.price}',
                            textColor: LightAppColors.primary400,
                            overflow: true,
                          ),
                          TitleMedium(
                            text: '${'/kg'}',
                            textColor: Theme.of(context).focusColor,
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: LightAppColors.primary400,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                quantity = (quantity! + 1)!;
                                CartCubit.get(context).fetchApdatCart(
                                    widget.model.productId, (quantity!));
                                //

                                //sum(quantity!, widget.model.price);
                                // print(total);
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 17,
                            )),
                      ),
                      TitleMedium(
                        text: '$quantity',
                        textColor: Theme.of(context).focusColor,
                        bold: true,
                      ),
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: LightAppColors.primary400,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (quantity! > 1) {
                                setState(() {
                                  quantity = (quantity! - 1)!;
                                  CartCubit.get(context).fetchApdatCart(
                                      widget.model.productId, (quantity!));
                                  // sum(quantity!, widget.model.price);
                                  //print(total);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 15,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
