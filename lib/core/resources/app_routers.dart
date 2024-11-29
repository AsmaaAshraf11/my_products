// core/resources/app_routers.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:myproducts/features/onboarding/presentation/views/start_view.dart';

class Routes {
  static const String onboard = "OnboardingView";
  static const String start = "StartView";
  static const String homeScreen = "/homeScreen";
  static const String storeTimesScreen = "/storeTimesScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // todo will add routes and screens here
    // todo this types when navigate route , simple , with var , use BlocProvider
    case Routes.onboard:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

        case Routes.start:
        return MaterialPageRoute(builder: (_) => const StartView());
      // case Routes.homeScreen:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      //
      //
      // case Routes.resetPasswordScreen:
      //   final email = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (_) => ResetPasswordScreen(email: email));
      //
      // case Routes.storeTimesScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) =>
      //           StoreTimeCubit(getIt.get<StoreTimeRepoImpl>())..getStoreTime(),
      //       child: const StoreTimesScreen(),
      //     ),
      //   );
      default:
        return _buildUndefinedRoute();
    }
  }

  static Route<dynamic> _buildUndefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
        ),
        body: const Center(child: Text('No route')),
      ),
    );
  }
}
