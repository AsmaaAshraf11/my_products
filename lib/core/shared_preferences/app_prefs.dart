// core/shared_preferences/app_prefs.dart
import 'package:shared_preferences/shared_preferences.dart';

const String isUserLoggedKey = "isUserLoggedKey";
const String authTokenKey = "authTokenKey";
const String darkMode = "lightMode";
const String savedStore = "savedStore";
const String onBoardingScreenViewed = "onBoardingScreenViewed";
const String userNameKey = "userNameKey";
const String languageCodeKey = 'languageCode';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // set login
  Future<void> setIsLogged() async {
    _sharedPreferences.setBool(isUserLoggedKey, true);
  }

  // is login
  bool isLogged()  {
    bool? isLog = _sharedPreferences.getBool(isUserLoggedKey);
    return isLog ?? false;
  }

  // logout
  Future<void> logout() async {
    _sharedPreferences.remove(isUserLoggedKey);
    _sharedPreferences.remove(authTokenKey);
    _sharedPreferences.remove(userNameKey);
    _sharedPreferences.remove(savedStore);
    //
    //currentUserHasPaid = false;
  }

  // set Auth Token
   Future<void> setAuthToken(String token) async {
    _sharedPreferences.setString(authTokenKey, token);
  }

  // get Auth Token
  Future<String> getAuthToken() async {
    String? token = _sharedPreferences.getString(authTokenKey);
    return token ?? '';
  }

  // set user name
  Future<void> setUserName(String name) async {
    _sharedPreferences.setString(userNameKey, name);
  }

  // get user name
  Future<String> getUserName() async {
    String? name = _sharedPreferences.getString(userNameKey);
    return name ?? '';
  }

  // dark mode
  Future<void> saveDarkMode({required bool isDark}) async {
    _sharedPreferences.setBool(darkMode, isDark);
  }

  // isDarkMode
  Future<bool> isDarkMode() async {
    bool? dark = _sharedPreferences.getBool(darkMode);
    if (dark != null) {
      return dark;
    } else {
      return false;
    }
  }

  // save store
  Future<void> saveStoreData(
      {required String storeId, required String storeName}) async {
    _sharedPreferences.setStringList(savedStore, [storeId, storeName]);
  }

  // get filter
  Future<List<String>> getStoreData() async {
    List<String>? store = _sharedPreferences.getStringList(savedStore);
    if (store != null) {
      return [store[0], store[1]];
    } else {
      return ['0', ''];
    }
  }

  // see on boarding
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(onBoardingScreenViewed, true);
  }

  // get on boarding
  bool isOnBoardingScreenViewed()  {
    return _sharedPreferences.getBool(onBoardingScreenViewed) ?? false;
  }

  // see on boarding
  Future<void> setLanguageCode({required String code}) async {
    _sharedPreferences.setString(languageCodeKey, code);
  }

  // get language code
  Future<String> getLanguageCode() async {
    return _sharedPreferences.getString(languageCodeKey) ?? 'ar';
  }
}
