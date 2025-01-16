// core/resources/app_routers.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';
import 'package:myproducts/features/home/data/repos/home_repo_impl.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:myproducts/features/login/data/repos/login_repo_impl.dart';
import 'package:myproducts/features/login/domain/use_cases/fetchDataLogin_use_case.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchDetailProduct_use_case.dart';
import 'package:myproducts/features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart';
import 'package:myproducts/features/login/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart';
import 'package:myproducts/features/home/presentation/views/my_cart_view.dart';
import 'package:myproducts/features/home/presentation/views/product_detail_view.dart';
import 'package:myproducts/features/layout/presentation/views/myproducts_layout.dart';
import 'package:myproducts/features/login/presentation/views/change_password_view.dart';
import 'package:myproducts/features/login/presentation/views/login_view.dart';
import 'package:myproducts/features/login/presentation/views/forget_Password_viewdart.dart';
import 'package:myproducts/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:myproducts/features/onboarding/presentation/views/start_view.dart';
import 'package:myproducts/features/signUp/presentation/views/sign_up_view.dart';

class Routes {
  static const String onboard = "OnboardingView";
  static const String start = "StartView";
  static const String loginScreen = "/login_view";
  static const String forgetPasswordScreen = "/forgetPassword_view";
  static const String changePasswordScreen = "/change_Password_view";
  static const String signUpScreen = "/sign_Up_view";

  static const String homeScreen = "/homeScreen";
  static const String layout = "/MyproductsLayout";
  static const String detail = "/prductDetail";
  static const String cart = "cart";
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

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => DataLoginCubit(
                    FetchdataloginUseCase(
                       getIt.get<LoginRepoImpl>(),
                    )
                  ),
                  child: const LoginScreen(),
                ));

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const ForgetPasswordViewdart());

      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePaswordView());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      case Routes.layout:
        return MaterialPageRoute(builder: (_) => MyproductsLayout());

      case Routes.detail:
        int id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => DatailproductCubit(
                    FetchdetailproductUseCase(
                      getIt.get<HomeRepoImpl>(),
                    ),
                  )..fetchDetail(id: id),
                  child: ProductDetailView(),
                ));
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const MyCartView());
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
