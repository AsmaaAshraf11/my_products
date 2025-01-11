// features/layout/presentation/views/myproducts_layout.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/favorites/presentation/views/favorites_view_body.dart';
import 'package:myproducts/features/home/data/models/login_model.dart';
import 'package:myproducts/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:myproducts/features/home/presentation/views/home_view_body.dart';
import 'package:myproducts/features/location/presentation/views/location_view_body.dart';
import 'package:myproducts/features/profile/presentation/views/profile_view_body.dart';

List<BottomNavigationBarItem> BottomItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.location_on), label: 'location'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
];

int currentIndex = 0;
var Searchcontroller = TextEditingController();

class MyproductsLayout extends StatefulWidget {
  LoginModel ?loginModel;

  MyproductsLayout({super.key, this.loginModel});
  @override
  State<MyproductsLayout> createState() => _MyproductsLayoutState();
}

class _MyproductsLayoutState extends State<MyproductsLayout> {
  
  @override
  Widget build(BuildContext context) {
    List<Widget> bottomScreen = [
  HomeViewBody(),
  FavoritesViewBody(),
  LocationViewBody(),
  ProfileViewBody(loginModel: widget.loginModel),
];
    return Scaffold(
      // appBar: AppBar(
        
      // ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,
          vertical: 40,
          ),
              child: Column(
                children: [
                  if (currentIndex != 3) CustomAppBar(loginModel: widget.loginModel,),
                  bottomScreen[currentIndex],
                ],
              ),
            ),
          ),
        
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: LightAppColors.maincolorgreen400,
          unselectedItemColor: LightAppColors.graycolor400,
          backgroundColor: Colors.white,
          items: BottomItem,
          elevation: 3,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
        ));
  }
}
