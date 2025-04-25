import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/browser.dart';

class ApiService {
  final Dio dio = Dio();
  final cookieJar = CookieJar();

  ApiService() {
    dio.options.baseUrl = kIsWeb ? 'http://localhost:5000'  : 'http://10.0.2.2:5000';
    dio.options.headers['Content-Type'] = 'application/json';
    if(!kIsWeb){
      dio.interceptors.add(CookieManager(cookieJar));
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    return dio.get(path, queryParameters: query);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) {
    return dio.post(path, data: data);
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) {
    return dio.put(path, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) {
    return dio.delete(path, data: data);
  }

  Future<Response> postFormData(String path, FormData formData) {
    return dio.post(path, data: formData);
  }
}

final apiService = ApiService(); 
