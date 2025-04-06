// features/layout/presentation/manger/cubit/bottom_navigation_bar_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/features/favorites/presentation/views/favorites_view_body.dart';
import 'package:myproducts/features/home/presentation/views/home_view_body.dart';
import 'package:myproducts/features/location/presentation/views/location_view_body.dart';
import 'package:myproducts/features/profile/presentation/views/profile_view_body.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreen = [
    HomeViewBody(),
    FavoritesViewBody(),
    LocationViewBody(),
    ProfileViewBody(),
  ];
  List<BottomNavigationBarItem> BottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Favorites'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_on), label: 'location'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
  ];

  void changBottomNavBar(index) {
    currentIndex = index;

    emit(BottomNavState());
  }
}
