


import 'package:dio/dio.dart';
import 'package:toursim/network/remote/api_url.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        receiveDataWhenStatusError: true,
        /* headers: {
            'Content-Type': 'application/json',
          }*/
      ),
    );
  }

  static Future<Response> getData({
    required String urlPath,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    return await dio.get(
      '${Uri(path: urlPath)}',
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    // dio.options.copyWith(
    //   headers: {
    //     "Content-Type":"multipart/form-data; boundary=<calculated when request is sent>",
    //     "Content-Length":"<calculated when request is sent>",
    //     "Host":"<calculated when request is sent>",
    //     "User-Agent":"PostmanRuntime/7.32.2",
    //     "Accept":"*/*",
    //     "Accept-Encoding":"gzip, deflate, br",
    //     "Connection":"keep-alive",
    //   },
    // );

    return await dio.post(
      '${Uri(path: urlPath)}',
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    return await dio.put(
      '${Uri(path: urlPath)}',
      data: data,
      queryParameters: query,
    );
  }
}
