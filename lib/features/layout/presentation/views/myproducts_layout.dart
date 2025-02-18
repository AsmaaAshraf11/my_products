// features/layout/presentation/views/myproducts_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/layout/presentation/manger/cubit/bottom_navigation_bar_cubit.dart';

var Searchcontroller = TextEditingController();

class MyproductsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences = getIt<AppPreferences>();
    final String userName = appPreferences.getUserName();

    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BottomNavigationBarCubit.get(context);
        return Scaffold(
            // appBar: AppBar(
    
            // ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                   // if (cubit.currentIndex != 3)
                    cubit.bottomScreen[cubit.currentIndex],
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: LightAppColors.maincolorgreen400,
              unselectedItemColor: LightAppColors.graycolor400,
              backgroundColor: Colors.white,
              items: cubit.BottomItem,
              elevation: 3,
              onTap: (index) {
                cubit.changBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
            ));
      },
    );
  }
}
