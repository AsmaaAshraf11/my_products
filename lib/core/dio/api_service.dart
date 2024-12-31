// core/dio/api_service.dart
import 'package:dio/dio.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/dio/end_points.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';

const String accept = '*/*';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/';
  final Dio _dio;
  final Map<String, String> _headers = {
    'Accept': accept,
  };

  ApiService(this._dio);

  Future<String> _getAuthorizationToken({required bool isToken}) async {
    if (!isToken) return '';
    final String backedToken = await getIt.get<AppPreferences>().getAuthToken();
    if (backedToken == '') return '';
    return 'Bearer $backedToken';
  }

  Future<String> _getLanguageCode() async {
    AppPreferences appPreferences = getIt.get<AppPreferences>();
    return await appPreferences.getLanguageCode();
  }

  Future<Map<String, dynamic>> _request({
    required String method,
    required Endpoint endpoint,
    dynamic data, // Change to dynamic to accept FormData
    bool isToken = true,
    String parameter = '',
  }) async {
    _headers['Authorization'] = await _getAuthorizationToken(isToken: isToken);
    _headers['Accept-Language'] = await _getLanguageCode();
    var response;
    final url =
        '$_baseUrl${endpoint.value}${parameter.isNotEmpty ? '/$parameter' : ''}';

    Options options = Options(
      headers: _headers,
    );

    switch (method) {
      case 'GET':
        response = await _dio.get(
          url,
          options: options,
        );
        break;
      case 'POST':
        response = await _dio.post(url, data: data, options: options);
        break;
      case 'DELETE':
        response = await _dio.delete(url, options: options);
        break;
      case 'PUT':
        response = await _dio.put(url, data: data, options: options);
        break;
    }

    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required Endpoint endpoint,
    bool isToken = true,
    String parameter = '',
    required String endPoint,
  }) async {
    return await _request(
        method: 'GET',
        endpoint: endpoint,
        isToken: isToken,
        parameter: parameter);
  }

  Future<dynamic> get2({
    required Endpoint endpoint,
    bool isToken = true,
    String parameter = '',
    required String endPoint,
  })  async {
    _headers['Authorization'] = await _getAuthorizationToken(isToken: isToken);
    _headers['Accept-Language'] = await _getLanguageCode();
    final url = '$_baseUrl${endpoint.value}${parameter.isNotEmpty ? '/$parameter' : ''}';
    Options options = Options(
      headers: _headers,
    );
     var response = await _dio.get(
      url,
      options: options,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required Endpoint endpoint,
    dynamic data = const {}, // Change to dynamic to accept FormData
    bool isToken = true,
    String parameter = '',
  }) async {
    return await _request(
        method: 'POST',
        endpoint: endpoint,
        data: data,
        isToken: isToken,
        parameter: parameter);
  }

  Future<Map<String, dynamic>> postWithImages({
    required Endpoint endpoint,
    required dynamic data, // Accept FormData
    bool isToken = true,
    String parameter = '',
  }) async {
    return await _request(
        method: 'POST',
        endpoint: endpoint,
        data: data,
        isToken: isToken,
        parameter: parameter);
  }

  Future<Map<String, dynamic>> delete({
    required Endpoint endpoint,
    bool isToken = true,
    String parameter = '',
  }) async {
    return await _request(
        method: 'DELETE',
        endpoint: endpoint,
        isToken: isToken,
        parameter: parameter);
  }

  Future<Map<String, dynamic>> put({
    required Endpoint endpoint,
    dynamic data = const {}, // Change to dynamic to accept FormData
    bool isToken = true,
  }) async {
    return await _request(
      method: 'PUT',
      endpoint: endpoint,
      data: data,
      isToken: isToken,
    );
  }
}
