import 'package:dio/dio.dart';
import 'package:gellary/core/utils/end_pints.dart';

abstract class DioHelper {
  Future<Response?> postData({
    required String url,
    required dynamic data,
    String token,
  });
  Future<Response?> getData(
      {required String url, Map<String, dynamic>? query, String token});
}

class DioImplement implements DioHelper {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: lBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<Response?> postData(
      {required String url, required dynamic data, String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',

    };

    return await dio.post(url, data: data);
  }

  @override
  Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {

      'Authorization': 'Bearer $token',
    };
    return await dio.get(url, queryParameters: query??null);
  }
}
