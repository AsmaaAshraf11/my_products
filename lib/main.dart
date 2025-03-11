// main.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/bloc_observer/bloc_observer.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/resources/app_constants.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/theme_manager.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:myproducts/features/cart/data/repos/cart_repo_impl.dart';
import 'package:myproducts/features/favorites/data/data_source/favorites_local_data_source.dart';
import 'package:myproducts/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:myproducts/features/favorites/domain/use_cases/fetchfavorites_use_cases.dart';
import 'package:myproducts/features/favorites/presentation/manger/Featured_fetch_favorites_Cubit/cubit/fetch_favorites_cubit.dart';
import 'package:myproducts/features/home/data/repos/home_repo_impl.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchCategory_use_cases.dart';
import 'package:myproducts/features/cart/presentation/manger/Featured_cart_cubit/cart_cubit.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchDetailProduct_use_case.dart';
import 'package:myproducts/features/home/presentation/manger/featured_DetailProduct_cubit/cubit/datailproduct_cubit.dart';
import 'package:myproducts/features/home/presentation/manger/theme/cubit/theme_cubit.dart';
import 'package:myproducts/features/layout/presentation/manger/cubit/bottom_navigation_bar_cubit.dart';
import 'package:myproducts/features/login/data/repos/login_repo_impl.dart';
import 'package:myproducts/features/login/domain/use_cases/fetchDataLogin_use_case.dart';
import 'package:myproducts/features/cart/domain/use_cases/fetchMyCart_use_case.dart';
import 'package:myproducts/features/home/domain/use_cases/fetchProducts_use_cases.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_category_Cubit/category_Cubit.dart';
import 'package:myproducts/features/home/presentation/manger/Featured_products_Cubit/products_Cubit.dart';
import 'package:myproducts/features/login/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart';
import 'package:myproducts/features/layout/presentation/views/myproducts_layout.dart';
import 'package:myproducts/features/login/presentation/views/login_view.dart';
import 'package:myproducts/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/features/search/data/repos/search_repo_impl.dart';
import 'package:myproducts/features/search/domain/use_cases/search_use_cases.dart';
import 'package:myproducts/features/search/presentation/manger/featured_search_cubit/search_cubit.dart';
import 'package:myproducts/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await FavoritesLocalDataSourceImpl().initDb();
  await CartLocaleDataSourceImpl().initDb();
  Bloc.observer = MyBlocObserver();
}

// getStartWidget
// todo this will  return i must open any screen
Widget getStartWidget() {
  final AppPreferences appPreferences = getIt<AppPreferences>();
  final bool isOnBoardingViewed = appPreferences.isOnBoardingScreenViewed();
  // currentUserName = await appPreferences.getUserName();
  if (isOnBoardingViewed) {
    final bool isLogged = appPreferences.isLogged();
    return isLogged ? MyproductsLayout() : LoginScreen();
  } else {
    return OnboardingView();
  }
}

void main() async {
  await initializeApp();
  runApp(MyApp(
    startWidget: getStartWidget(),
  ));
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
              return DatailproductCubit(
                FetchdetailproductUseCase(
                  getIt.get<HomeRepoImpl>(),
                ),
              );
            },
          ),
         
          // BlocProvider(
          //   create: (context) {
          //     return DeleteCartCubit(FetchDeletecartUseCases(
          //       getIt.get<CartRepoImpl>(),
          //     ));
          //   },
          // ),
           BlocProvider(
            create: (context) {
              return CartCubit(FetchmycartUseCase(
                getIt.get<CartRepoImpl>(),
              ))..fetchCart();
            },
          ),
          BlocProvider(
            create: (context) {
              return DataLoginCubit(FetchdataloginUseCase(
                getIt.get<LoginRepoImpl>(),
              ));
            },
          ),
          BlocProvider(
            create: (context) => BottomNavigationBarCubit(),
          ),
         
          BlocProvider(
            create: (context) {
              return SearchCubit(
                SearchUseCases(
                  getIt.get<SearchRepoImpl>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (context) {
              return FetchFavoritesCubit(FetchfavoritesUseCases(
                getIt.get<FavoritesRepoImpl>(),
              ))..GetFavorites();
            },
          ),
          
          BlocProvider(
            create: (context) {
              return ThemeCubit()..isDarkMode();
            },
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            if(state is ThemeSuccess) {
              return MaterialApp(
                locale: Locale('en'),
                 localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              theme: state.themeMode==MyThemeMode.light?lightTheme:darkTheme,
              //ThemeData(),
              // theme: lightTheme,
              home:
                  // LoginScreen(),
                 // OnboardingView(),
                  startWidget,
              //initialRoute: Routes.homeScreen,
              onGenerateRoute: RouteGenerator.getRoute,
            );
            } else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
