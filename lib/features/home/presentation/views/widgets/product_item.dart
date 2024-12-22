// features/home/presentation/views/widgets/product_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
    Color? isfavorite=LightAppColors.graycolor400;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (BuildContext context, ProductsState state) {
        if (state is ProductsSuccess) {
          // print(state.products.length);
        }
      },
      builder: (BuildContext context, ProductsState state) {
        return GestureDetector(
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
                //  bottom: BorderSide()

                // color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: LightAppColors.graycolor400,
                      onPressed: () {
                        setState(() {
            isfavorite=LightAppColors.red;
                   });
                     
                      },
                      icon: Icon(Icons.favorite,
                      color:isfavorite,
                      ),
                    ),
                  ),
                  Image.asset(
                    ImageAssets.imge1,
                    width: 100,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleMedium(
                          text: 'hair oil',
                          textColor: LightAppColors.black,
                          bold: true,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${'\$6.99'}' + ' ',
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
                                children: [Rating()],
                              )
                            ])
                      ])
                ],
              )),
        );
      },
    );
  }
}
