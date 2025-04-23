import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_app/models/User.dart';
import '../core/secure_storage.dart';
import 'api_service.dart';

class UserService {
  final ApiService _api = ApiService();

  Future<bool> uploadProfilePhoto(File file) async {
    final token = await TokenStorage.getToken();

    final formData = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(file.path, filename: 'upload.jpg'),
    });

    final res = await _api.dio.post(
      '/user/upload',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return res.statusCode == 200;
  }
  
  Future<List<UserModel>> fetchAllUsers() async {
    final response = await _api.get('/admin');
    print('Fetched users: ${response.data}');

    final List<dynamic> data = response.data; 
    return data.map((json) => UserModel.fromJson(json)).toList();
  }
  Future<Response> getUserProfile() async {
    final token = await TokenStorage.getToken();
    return await _api.dio.get(
      '/user/profile',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
  }
}
