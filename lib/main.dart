// main.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/bloc_observer/bloc_observer.dart';
import 'package:myproducts/core/constants/constants.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/resources/app_constants.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/home/data/repos/home_repo_impl.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchAddNweCart_use_case.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchCategory_use_cases.dart';
import 'package:myproducts/features/login/data/repos/login_repo_impl.dart';
import 'package:myproducts/features/login/domain/use_cases/fetchDataLogin_use_case.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchMyCart_use_case.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchProducts_use_cases.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_cart_cubit/cubit/cart_cubit.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/login/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart';
import 'package:myproducts/features/home/presentation/manger/featured_new_cart/cubit/new_cart_cubit.dart';
import 'package:myproducts/features/layout/presentation/views/myproducts_layout.dart';
import 'package:myproducts/features/login/presentation/views/login_view.dart';
import 'package:myproducts/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
}

// getStartWidget
// todo this will  return i must open any screen
Widget getStartWidget()  {
  final AppPreferences appPreferences = getIt<AppPreferences>();
  final bool isOnBoardingViewed =  appPreferences.isOnBoardingScreenViewed();
  //currentUserName = await appPreferences.getUserName();
  if (isOnBoardingViewed) {
    final bool isLogged =  appPreferences.isLogged();
    return isLogged ?  MyproductsLayout() : const LoginScreen();
  } else {
    return const OnboardingView();
  }
}
void main() async {
  await initializeApp();
  runApp(  MyApp(startWidget: getStartWidget(),));
}

class MyApp extends StatelessWidget {
    MyApp({super.key, required this.startWidget});
   final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ProductsCubit(
                FetchproductsUseCases(
                  getIt.get<HomeRepoImpl>(),
                ),
              )..fetchProduct();
            },
          ),
          BlocProvider(
            create: (context) {
              return CategoryCubit(
                FetchcategoryUseCases(
                  getIt.get<HomeRepoImpl>(),
                ),
              )..fetchCategory();
            },
          ),
          BlocProvider(
            create: (context) {
              return CartCubit(
                FetchmycartUseCase(
                  getIt.get<HomeRepoImpl>(),
                ),
              )..fetchCart();
            },
          ),
          BlocProvider(
            create: (context) {
              return NewCartCubit(FetchAddNweCartUseCase(
                getIt.get<HomeRepoImpl>(),
              ));
            },
          ),
          BlocProvider(
            create: (context) {
              return DataLoginCubit(FetchdataloginUseCase(
                getIt.get<LoginRepoImpl>(),
              ));
            },
          ),
        ],
        child: MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
           
          ),
          // theme: lightTheme,
          home: 
          //LoginScreen(),
          startWidget,
          //initialRoute: Routes.homeScreen,
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
    );
  }
}
