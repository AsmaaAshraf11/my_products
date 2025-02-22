// features/cart/presentation/views/widgets/my_cart_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/cart/data/models/cart/product.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';

class MyCartItem extends StatefulWidget {
  MyCartItem({super.key, required this.model});
  Product model;

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          padding: EdgeInsets.all(9),
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
                            child: CustomProductImage(
                                imageUrl:widget.model.thumbnail!),
                          ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Powder Canister
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
                        text: '${'\$${widget.model.price}'}',
                        textColor: LightAppColors.primary400,
                        overflow: true,
                      ),
                      TitleMedium(
                        text: '${'/kg'}',
                        textColor: LightAppColors.textcolor,
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
                            number++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 17,
                        )),
                  ),
                  TitleMedium(
                    text: '$number',
                    textColor: LightAppColors.textcolor,
                    bold: true,
                  ),
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: LightAppColors.primary400,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (number > 1) {
                            setState(() {
                              number--;
                            });
                          }
                        },
                        icon: Icon(
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
  }
}
