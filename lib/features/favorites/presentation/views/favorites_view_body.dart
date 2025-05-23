// features/favorites/presentation/views/favorites_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:myproducts/features/favorites/domain/use_cases/fetchfavorites_use_cases.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_fetch_favorites_Cubit/cubit/fetch_favorites_cubit.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';

// ignore: must_be_immutable
class FavoritesViewBody extends StatelessWidget {
  var Searchcontroller = TextEditingController();

  FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchFavoritesCubit(FetchfavoritesUseCases(
        getIt.get<FavoritesRepoImpl>(),
      ))
        ..GetFavorites(),
      child: BlocConsumer<FetchFavoritesCubit, FetchFavoritesState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductsEntity> product =
              FetchFavoritesCubit.get(context).favorite;
          return Scaffold(
            appBar: AppBar(
              title:Center(
                child: HeadLine22(
                            text: 'My favorite products',
                          ),
              ) ,
            ),
             backgroundColor: Theme.of(context).canvasColor,
            body: product.length==0?  
                          Center(
                             child: const TitleMedium(
                                          text: 'there is nothing in favorites now....',
                                        ),
                           
                       ): 
            SingleChildScrollView(
              child:  Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
                child:
                       
                Column(
                 crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                  
                         
                        
                        
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 27,
                        mainAxisSpacing: 20,
                        childAspectRatio: .86,
                        children: List.generate(
                            product.length,
                            (index) => SizedBox(
                                  //  height:context.screenHeight*0.4,
                                  child: ProductItem(
                                    productsModel: product[index],
                                  ),
                                )),
                      ),
                    )
            
                    // GridViewPopular(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
