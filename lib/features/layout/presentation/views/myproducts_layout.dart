// features/layout/presentation/views/myproducts_layout.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/favorites/presentation/views/favorites_view_body.dart';
import 'package:myproducts/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:myproducts/features/home/presentation/views/home_view_body.dart';
import 'package:myproducts/features/location/presentation/views/location_view_body.dart';
import 'package:myproducts/features/login/presentation/views/login_view.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';
import 'package:myproducts/features/profile/presentation/views/profile_view_body.dart';

List<BottomNavigationBarItem> BottomItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.location_on), label: 'location'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
];
List<Widget> bottomScreen = [
  HomeViewBody(),
  FavoritesViewBody(),
  LocationViewBody(),
  ProfileViewBody(),
];
int currentIndex = 0;
var Searchcontroller = TextEditingController();

class MyproductsLayout extends StatefulWidget {
  @override
  State<MyproductsLayout> createState() => _MyproductsLayoutState();
}

class _MyproductsLayoutState extends State<MyproductsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (currentIndex != 3) CustomAppBar(),
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
