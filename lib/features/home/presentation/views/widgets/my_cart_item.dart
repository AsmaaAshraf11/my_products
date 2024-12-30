// features/home/presentation/views/widgets/my_cart_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/data/models/cart/product.dart';

class MyCartItem extends StatefulWidget {
   MyCartItem({super.key,required this.model});
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
              color: LightAppColors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImageAssets.imge1,
                width: 100.w,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Powder Canister
                  HeadLine22(
                    text: '${widget.model.title}',
                    bold: false,
                  ),
                  10.h.heightSizedBox,
                  Row(
                    children: [
                      HeadLine22(
                        text: '${'\$${widget.model.price}'}',
                        textColor: LightAppColors.maincolorgreen400,
                      ),
                      TitleMedium(
                        text: '${'/kg'}',
                        textColor: LightAppColors.black,
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
                    backgroundColor: LightAppColors.maincolorgreen400,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            number++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: LightAppColors.white,
                          size: 17,
                        )),
                  ),
                  TitleMedium(
                    text: '$number',
                    textColor: LightAppColors.black,
                    bold: true,
                  ),
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: LightAppColors.maincolorgreen400,
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
                          color: LightAppColors.white,
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
