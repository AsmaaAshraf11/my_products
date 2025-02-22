// features/home/presentation/manger/theme/cubit/theme_state.dart
part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}
class   ThemeLoading extends ThemeState {}

class ThemeSuccess extends ThemeState {
  final MyThemeMode themeMode;

  ThemeSuccess(this.themeMode);
}
enum MyThemeMode{ light,dark}
