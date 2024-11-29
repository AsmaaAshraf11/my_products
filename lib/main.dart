// main.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myproducts/core/bloc_observer/bloc_observer.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/resources/app_constants.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/theme_manager.dart';
import 'package:myproducts/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
}

// getStartWidget
// todo this will  return i must open any screen
// Future<Widget> getStartWidget() async {
//   final AppPreferences appPreferences = getIt<AppPreferences>();
//   final bool isOnBoardingViewed = await appPreferences.isOnBoardingScreenViewed();
//   currentUserName = await appPreferences.getUserName();
//   if (isOnBoardingViewed) {
//     final bool isLogged = await appPreferences.isLogged();
//     return isLogged ? const HomeScreen() : const AuthScreen();
//   } else {
//     return const OnBoardingScreen();
//   }
// }
void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: const MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
       // theme: lightTheme,
        home:  OnboardingView(),
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}

