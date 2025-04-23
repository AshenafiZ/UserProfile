import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio dio = Dio();
  final cookieJar = CookieJar();

  ApiService() {
    dio.options.baseUrl = kIsWeb ? 'http://localhost:5000/api'  : 'http://10.0.2.2:5000/api ';
    dio.options.headers['Content-Type'] = 'application/json';
    if(!kIsWeb){
      dio.interceptors.add(CookieManager(cookieJar));
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return await dio.get(path);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> postFormData(String path, FormData formData) async {
    return await dio.post(path, data: formData);
  }
}

final apiService = ApiService(); // Exported instance
