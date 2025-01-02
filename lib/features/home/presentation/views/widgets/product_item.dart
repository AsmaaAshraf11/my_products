// features/home/presentation/views/widgets/product_item.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';

class ProductItem extends StatefulWidget {
  ProductItem({super.key, required this.productsModel});
  ProductsEntity ?productsModel;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Color? isfavorite = LightAppColors.graycolor400;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushRoute(context, Routes.detail,arguments: widget.productsModel!.productId);
      },
      child: Container(
          // width: 170,
          // height: 200,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8)
            ],
           
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: LightAppColors.graycolor400,
                  onPressed: () {
                    setState(() {
                      isfavorite = LightAppColors.red;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isfavorite,
                  ),
                ),
              ),
              CustomProductImage(
                  imageUrl: widget.productsModel!.images?[1] ?? ''),
              // const SizedBox(
              //   width: 30,
              // ),
              // Image.asset(
              //   ImageAssets.imge1,
              //   width: 100,
              // ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TitleMedium(
                  overflow: true,
                  text: widget.productsModel!.titleProduct??'',
                  // 'hair oil',
                  textColor: LightAppColors.black,
                  bold: true,
                ),
                RichText(
                  text: TextSpan(
                    text: '${'\$'}' + '${widget.productsModel?.price??''}',
                    //'${'\$6.99'}' + ' ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: LightAppColors.maincolorgreen400),
                    children: [
                      TextSpan(
                        text: '${'/kg'}',
                        style: TextStyle(
                            color: LightAppColors.graycolor400,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: LightAppColors.graycolor400,
                            size: 14,
                          ),
                          SmallHeader(
                            text: '40min',
                            color: LightAppColors.graycolor400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Rating(
                            rating: '${widget.productsModel?.rating}',
                          )
                        ],
                      )
                    ])
              ])
            ],
          )),
    );
  }
}
