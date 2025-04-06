// features/home/presentation/manger/theme/cubit/theme_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);

  void setDarkMode(bool value) {
    AppPreferences appPreferences = getIt.get<AppPreferences>();
    appPreferences.saveDarkMode(isDark: value);
    emit(ThemeSuccess(value ? MyThemeMode.dark : MyThemeMode.light));
  }

  void isDarkMode() async {
    emit(ThemeLoading());
    AppPreferences appPreferences = getIt.get<AppPreferences>();
    bool isDark = await appPreferences.isDarkMode();

    emit(ThemeSuccess(isDark ? MyThemeMode.dark : MyThemeMode.light));
  }
}
