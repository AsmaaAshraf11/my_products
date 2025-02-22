// features/home/presentation/views/widgets/product_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_add_favorites_Cubit/cubit/add_favorites_cubit.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_delet_favorites_Cubit/cubit/deletefavorites_cubit.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_get_favorites_Cubit/cubit/get_favorites_cubit.dart';
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
  bool isfavorite=false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletefavoritesCubit, DeletefavoritesState>(
      builder: (context, state) {
        return BlocConsumer<AddFavoritesCubit, AddFavoritesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var deletecubit=DeletefavoritesCubit.get(context);
            var addFavoritesCubit=AddFavoritesCubit.get(context);
            List<int>idfavorit= GetFavoritesCubit. get(context).idfavorit;
             List<ProductsEntity>favorit= GetFavoritesCubit. get(context).favorite;
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
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
              if ((GetFavoritesCubit. get(context).isExist(product:widget. productsModel))) {
                deletecubit.DeleteFavorites(widget.productsModel.productId);
              }
              else{
                addFavoritesCubit.AddFavorites(widget.productsModel);
                isfavorite = true;
              }
            });
                              
                        
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: GetFavoritesCubit. get(context).isExist(product:widget. productsModel)?LightAppColors.red:LightAppColors.graycolor400,
                            ),
                          ),
                        ),
                        CustomProductImage(
                            imageUrl: widget.productsModel.image ?? ''),
                       
                        // ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleMedium(
                                overflow: true,
                                text: widget.productsModel!.titleProduct ?? '',
                                // 'hair oil',
                                textColor: LightAppColors.textcolor,
                                bold: true,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '${'\$'}' +
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
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          rating:
                                              '${widget.productsModel?.rating}',
                                        )
                                      ],
                                    )
                                  ])
                            ])
                      ],
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
