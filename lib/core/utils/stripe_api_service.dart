// core/utils/stripe_api_service.dart
import 'package:dio/dio.dart';


class StripeApiService {
  final String _baseUrl = 'https://api.stripe.com/v1/';
  final Dio _dio = Dio();
  

  //StripeApiService(this._dio);
  Future<dynamic> post({ 
    String? token,
    dynamic data, 
    String parameter = '',
         required String endpoints,

   //  required String url,
   final Map<String, String>?headers,


  }) async {
    final url = '$_baseUrl${endpoints}';
    var response;
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType ,
      headers:headers?? {
        'Authorization': 'Bearer $token',
        'Content-Type': Headers.formUrlEncodedContentType
      },
    );
      response = await _dio.post(url, data: data, options: options);
      return response.data;
  }
 

 
}
