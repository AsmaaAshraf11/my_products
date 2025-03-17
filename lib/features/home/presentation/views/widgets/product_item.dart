// features/home/presentation/views/widgets/product_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/constants/constants.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_fetch_favorites_Cubit/cubit/fetch_favorites_cubit.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/presentation/views/widgets/custom_product_image.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';

class ProductItem extends StatefulWidget {
  ProductItem({super.key, required this.productsModel});

  ProductsEntity productsModel;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // Color? isfavorite = LightAppColors.graycolor400;
  bool isfavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(
          FetchFavoritesCubit.get(context).idfavorit.contains(widget.productsModel.productId)) {
      setState(() {
        isfavorite  = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFavoritesCubit, FetchFavoritesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FetchFavoritesCubit.get(context);
       // List<int> idfavorit = FetchFavoritesCubit.get(context).idfavorit;
        List<ProductsEntity> favorit = FetchFavoritesCubit.get(context).favorite;
        return SizedBox(
          height: context.screenHeight * 0.4,
          child: GestureDetector(
            onTap: () {
              pushRoute(context, Routes.detail,
                  arguments: widget.productsModel.productId);
            },
            child: Container(
                //height:context.screenHeight*0.5,
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
                   // Text('$isfavorite'),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          if(isfavorite){
                            // delete
                            cubit.DeleteFavorites(widget.productsModel.productId);
                            setState(() {
                              isfavorite = false;
                            });
                          }else{
                            // add
                            cubit.AddFavorites(
                                        widget.productsModel);
                            setState(() {
                              isfavorite =true;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isfavorite
                              ? LightAppColors.red
                              : LightAppColors.graycolor400,
                        ),
                      ),
                    ),
                   //  Text('${FetchFavoritesCubit.get(context).idfavorit}'),
                    CustomProductImage(
                        imageUrl: widget.productsModel.image ?? ''),
    
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: TitleMedium(
                              overflow: true,
                              text: widget.productsModel!.titleProduct ?? '',
                              // 'hair oil',
                              textColor: Theme.of(context).focusColor,
                              bold: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                               mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '${'\$'}'+
                                        '${widget.productsModel?.price ?? ''}',
                                    //'${'\$6.99'}' + ' ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: LightAppColors.primary400),
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
                                Rating(
                                  rating:
                                      '${widget.productsModel.rating}',
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              
                            ],
                          )
                        ])
                  ],
                )),
          ),
        );
      },
    );
  }
}
