import 'package:dio/dio.dart';

class AppClient {
  late Dio _dio;

  AppClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/movie/',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return await _dio.get(endpoint, queryParameters: params);
  }
}
