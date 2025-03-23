// core/di/service_locator.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myproducts/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:myproducts/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:myproducts/features/cart/data/repos/cart_repo_impl.dart';
import 'package:myproducts/features/favorites/data/data_source/favorites_local_data_source.dart';
import 'package:myproducts/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:myproducts/features/home/data/data_source/home_remote_data_source.dart';
import 'package:myproducts/features/home/data/repos/home_repo_impl.dart';
import 'package:myproducts/features/location/data/data_source/save_location_local_data_source.dart';
import 'package:myproducts/features/location/data/repos/location_repo_impl.dart';
import 'package:myproducts/features/login/data/data_source/login_remote_data_source.dart';
import 'package:myproducts/features/login/data/repos/login_repo_impl.dart';
import 'package:myproducts/features/search/data/data_source/search_remote_data_source.dart';
import 'package:myproducts/features/search/data/repos/search_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myproducts/core/dio/api_service.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  _registerDio();
  _registerApiService();
  await _registerSharedPreferences();
  _registerAppPreferences();
  _registerRepositories();
}

void _registerDio() {
  getIt.registerSingleton<Dio>(Dio());
}

void _registerApiService() {
  getIt.registerSingleton<ApiService>(
    ApiService(getIt.get<Dio>()),
  );
}

Future<void> _registerSharedPreferences() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
}

void _registerAppPreferences() {
  getIt.registerSingleton<AppPreferences>(
    AppPreferences(getIt.get<SharedPreferences>()),
  );
}

void _registerRepositories() {
  final apiService = getIt.get<ApiService>();
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(apiService),
    ),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(apiService),
    ),
  );
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
        cartLocalDataSource: CartLocaleDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
     searchRemoteDataSource: SearchRemoteDataSourceImpl(apiService),
    ),
  );

  getIt.registerSingleton<FavoritesRepoImpl>(
    FavoritesRepoImpl(
      favoritesLocalDataSourceImpl: FavoritesLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<LocationRepoImpl>(
    LocationRepoImpl(
      saveLocationLocalDataSourceImpl: SaveLocationLocalDataSourceImpl(),
    ),
  );

  // todo uncomment this when add repoImp
  // getIt
  //   ..registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService))
  //   ..registerSingleton<LoginRepoImpl>(LoginRepoImpl(apiService))
}
