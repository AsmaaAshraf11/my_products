// features/home/presentation/views/widgets/product_detail_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart';
import 'package:myproducts/features/home/presentation/views/widgets/counter_detail.dart';
import 'package:myproducts/features/home/presentation/views/widgets/description_product.dart';
import 'package:myproducts/features/home/presentation/views/widgets/mid_buttom.dart';
import 'package:myproducts/features/home/presentation/views/widgets/myclipper.dart';
import 'package:myproducts/features/home/presentation/views/widgets/review_and_rating.dart';
import 'package:myproducts/features/login/presentation/views/widgets/iconbutton_arrow_back.dart';

class ProductDetailViewBody extends StatelessWidget {
  //ProductDetailViewBody({required this.model});
 // ProductsEntity model;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatailproductCubit, DatailproductState>(
      listener: (context, state) {
        if(state is DatailSuccess)
        print(state.products.price);
        //print(model.titleProduct);
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 320,
                  color: LightAppColors.green300?.withOpacity(0.6),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconbuttonArrowBack(
                        route: Routes.layout,
                        iconColor: Colors.white,
                        padding: 20.0,
                        buttonColor: LightAppColors.maincolorgreen700,
                      ),
                      IconbuttonArrowBack(
                        iconColor: Colors.white,
                        padding: 20.0,
                        icon: Icons.favorite,
                        buttonColor: LightAppColors.maincolorgreen700,
                      )
                    ],
                  ),
                  Image.asset(
                    ImageAssets.imge1,
                    // height: 180,
                    width: 180,
                  ),
                ],
              ),
              CounterDetail()
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                  child: HeadLine22(
                text: 'Powder Canister',
              )),
            ),
            ReviewAndRating(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  DescriptionProduct(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MidButtom(
                          text: '\$6.99',
                          onPressed: () {},
                        ),
                        MidButtom(
                          text: 'Add Cart',
                          onPressed: () {},
                        )
                      ],
                    ),
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
