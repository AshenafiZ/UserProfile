import 'package:dio/dio.dart';
import '../core/secure_storage.dart';
import '../models/User.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _api = ApiService();

  Future<UserModel?> login(String email, String password, bool rememberMe) async {
    try {
      final response = await _api.post('/api/login', data: {
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = response.data;
        return UserModel.fromJson(userData); 
      } else {
        print('Login failed: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle error (e.g., network issues)
      print('Error during login: $e');
    }
  }
  
  Future<UserModel?> register(Map<String, dynamic> userData) async {
    final response = await _api.post('/api/register', data: userData);

    if (response.statusCode == 201) {
      final data = response.data;
      await TokenStorage.saveToken(data['token']);
      return UserModel.fromJson(data['user']);
    }
    return null;
  }

  Future<Response> logout() async {
    await TokenStorage.clearToken();
    return _api.post('/api/logout');
  }

  Future<Response> refreshToken() {
    return _api.post('/api/refresh');
  }
}
