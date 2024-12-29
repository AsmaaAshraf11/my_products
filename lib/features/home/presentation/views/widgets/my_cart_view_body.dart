// features/home/presentation/views/widgets/my_cart_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/delet_item_cart.dart';
import 'package:myproducts/features/home/presentation/views/widgets/my_cart_item.dart';
import 'package:myproducts/features/login/presentation/views/widgets/button.dart';
import 'package:myproducts/features/login/presentation/views/widgets/iconbutton_arrow_back.dart';
class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  
  List item=[1,2,3,4,5];
    int length=5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconbuttonArrowBack(route: Routes.layout, iconColor: Colors.white, padding: 20.0,
                buttonColor:LightAppColors.maincolorgreen700,),
                Text( 'My Cart',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
                ),
                 IconbuttonArrowBack(route: Routes.cart, iconColor: Colors.white, padding: 20.0,
                 icon: Icons.notifications,
                 buttonColor:LightAppColors.maincolorgreen700,),
                              
            ],
           ),
           30.h.heightSizedBox,
           SizedBox(
            height:context.screenHeight*0.5,
             child: ListView.builder(
             // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: length,
               itemBuilder: (BuildContext context, int index) {  
                return
                Dismissible(
                  onDismissed: ( direction) {
                    setState(() {
                      item.remove(index);
                    });
                  },
                   background:DeletItemCart(),
                  key:ValueKey<int>(item[index]) ,
                  child:  MyCartItem() ,                
                );
               }
             ),
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
                    TitleMedium(text: 'Shopping cost',textColor: LightAppColors.graycolor600,
                    fontSize: 18,
                    ),
                    TitleMedium(bold: true,
                      text: '${'\$27.99'}',textColor: LightAppColors.black,)
                  ],
                ),
                 15.h.heightSizedBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleMedium(text: 'Delivery cost',textColor: LightAppColors.graycolor600,
                    fontSize: 18,
                    ),
                    TitleMedium(bold: true,
                      text: '${'\$12.99'}',textColor: LightAppColors.black,)
                  ],
                ),
                15.h.heightSizedBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadLine22(text: 'Total cost',
                    ),
                    HeadLine22(
                      text: '${'\$40.99'}',textColor: LightAppColors.black,)
                  ],
                ),
                25.h.heightSizedBox,
                defaultButton(
                                onPressed: () {
                                },
                                text: 'Checkout',
                              ),
              ],
              
             ),
           ),    
        ],
      ),
    );
  }
}