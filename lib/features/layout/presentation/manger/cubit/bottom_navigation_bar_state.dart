// features/layout/presentation/manger/cubit/bottom_navigation_bar_state.dart
part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState {}

final class BottomNavigationBarInitial extends BottomNavigationBarState {}
final class BottomNavState extends BottomNavigationBarState {}

